""" Testing for the vector ops

"""
import unittest
import sqlite3
import os
from time import sleep
from tempfile import NamedTemporaryFile
from rsxml.debug import TimerBuckets, Timer
from rsxml.debug.timer_buckets import TimerBucketsBorg


class TimerTests(unittest.TestCase):
    """[summary]

    Args:
        unittest ([type]): [description]
    """

    def test_timer_buckets(self):
        """ NOTE: THis is testing a Borg pattern, so it's a bit weird
        pytest runs everything parallel so we need to do all the testing for 
        this class in one massive unit test
        """
        meta1 = {'something': 2, 'somethingElse': "DUMB"}
        meta2 = {'something': 22, 'somethingElse': "DUMBER"}
        my_buckets = TimerBuckets(table_name="debug_table", meta=meta1)

        with TimerBuckets('key1'):
            sleep(2)

        with TimerBuckets('key1'):
            sleep(2)

        with TimerBuckets('key2'):
            sleep(3)

        self.assertEqual(my_buckets.table_name, "debug_table")
        self.assertEqual(my_buckets.active, True)
        self.assertAlmostEqual(my_buckets.timers['key1'], 4, 1)
        self.assertAlmostEqual(my_buckets.timers['key2'], 3, 1)
        self.assertAlmostEqual(my_buckets.total, 7, 1)
        self.assertDictEqual(my_buckets.meta, meta1)
        self.assertEqual(len(my_buckets.timers.keys()), 2)

        my_buckets.tick(meta2)
        self.assertDictEqual(my_buckets.meta, meta2)
        self.assertDictEqual(my_buckets.ticks[0].meta, meta1)
        self.assertAlmostEqual(my_buckets.ticks[0].timers['key1'], 4, 1)
        self.assertAlmostEqual(my_buckets.ticks[0].timers['key2'], 3, 1)
        self.assertAlmostEqual(my_buckets.ticks[0].total, 7, 1)
        self.assertEqual(len(my_buckets.ticks), 1)
        self.assertEqual(len(my_buckets.timers.keys()), 0)
        self.assertAlmostEqual(my_buckets.total, 7, 1)

        TimerBuckets(reset=True)
        self.assertEqual(len(my_buckets.ticks), 0)
        self.assertEqual(len(my_buckets.timers.keys()), 0)
        self.assertAlmostEqual(my_buckets.total, 0, 1)
        self.assertEqual(my_buckets.table_name, "DEBUG")

        """Nothing should not happen when we set this as innactive
        """
        TimerBucketsBorg._shared_state = {}  # reset the Borg

        meta1 = {'something': 2, 'somethingElse': "DUMB"}
        meta2 = {'something': 22, 'somethingElse': "DUMBER"}
        my_buckets = TimerBuckets(meta=meta1, active=False)

        with TimerBuckets('key1'):
            sleep(0.002)

        with TimerBuckets('key1'):
            sleep(0.002)

        with TimerBuckets('key2'):
            sleep(0.003)
        my_buckets.tick(meta2)

        self.assertEqual(my_buckets.active, False)
        self.assertEqual(my_buckets.tick_total, 0)
        self.assertEqual(my_buckets.total, 0)
        self.assertEqual(len(my_buckets.meta), 0)
        self.assertEqual(len(my_buckets.ticks), 0)

        TimerBucketsBorg._shared_state = {}  # reset the Borg
        meta1 = {'something': 2, 'somethingElse': "DUMB", "conflictC": "text", "conflictD": 23}
        meta2 = {'something': 22, 'somethingElse': "DUMBER", "conflictA": None, "conflictB": None, "conflictC": None, "conflictD": "text"}
        meta3 = {'something_NEW': 22, 'somethingElse_NEW': "DUMBER", "conflictA": 23, "conflictB": "text"}
        my_buckets = TimerBuckets(meta=meta1, active=True)

        with TimerBuckets('key1'):
            sleep(0.002)

        with TimerBuckets('key1'):
            sleep(0.002)

        my_buckets.tick(meta2)

        with TimerBuckets('key2'):
            sleep(0.003)

        my_buckets.tick(meta3)
        with TimerBuckets('key1'):
            sleep(0.002)
        with TimerBuckets('key3'):
            sleep(0.002)
        # Final tick to close it off
        my_buckets.tick()

        cols, rows = my_buckets.generate_table()
        self.assertListEqual(cols, [
            ('tick', 'INTEGER'),
            ('something', 'INTEGER'),
            ('somethingElse', 'TEXT'),
            ('conflictC', 'TEXT'),
            ('conflictD', 'TEXT'),
            ('conflictA', 'INTEGER'),
            ('conflictB', 'TEXT'),
            ('something_NEW', 'INTEGER'),
            ('somethingElse_NEW', 'TEXT'),
            ('tmr_key1', 'REAL'),
            ('tmr_key2', 'REAL'),
            ('tmr_key3', 'REAL'),
            ('timer_total', 'REAL')
        ])
        self.assertListEqual(rows, [
            [0, 2, 'DUMB', 'text', '23', None, None, None, None, 0.0, None, None, 0.0],
            [1, 22, 'DUMBER', None, 'text', None, None, None, None, None, 0.0, None, 0.0],
            [2, None, None, None, None, 23, 'text', 22, 'DUMBER', 0.0, None, 0.0, 0.0]
        ])

        """Test the CSV output"""
        TimerBucketsBorg._shared_state = {}  # reset the Borg

        meta1 = {'something': 2, 'somethingElse': "DUMB"}
        my_buckets = TimerBuckets(meta=meta1)

        with TimerBuckets('key1'):
            sleep(0.002)

        with TimerBuckets('key1'):
            sleep(0.002)

        with TimerBuckets('key2'):
            sleep(0.003)
        my_buckets.tick()

        with NamedTemporaryFile(suffix='.csv') as tempfile:
            tempfile.close()
            my_buckets.write_csv(tempfile.name)

            with open(tempfile.name, 'r') as f:
                self.assertEqual(f.readline(), "tick,something,somethingElse,tmr_key1,tmr_key2,timer_total\n")
                self.assertEqual(f.readline(), '0,2,DUMB,0.0,0.0,0.0\n')

        """Test the SQLite output"""
        TimerBucketsBorg._shared_state = {}  # reset the Borg

        table_name = 'DEBUG_TABLE'
        conn = sqlite3.connect(':memory:')
        meta1 = {'something': 2, 'somethingElse': "DUMB"}

        my_buckets = TimerBuckets(meta=meta1, table_name=table_name)

        with TimerBuckets('key1'):
            sleep(0.002)

        with TimerBuckets('key1'):
            sleep(0.002)

        with TimerBuckets('key2'):
            sleep(0.003)
        my_buckets.tick()

        my_buckets.write_sqlite(conn)

        # Second write should replace the table
        my_buckets.write_sqlite(conn)

        curs = conn.cursor()
        rows = curs.execute(f'SELECT * FROM {table_name}').fetchall()
        self.assertListEqual(rows, [
            (0, 2, 'DUMB', 0.0, 0.0, 0.0
             )])

        # NOTE: SKIP THIS TEST IF WE DON'T HAVE A GEOPACKAGE
        if 'GPKG_TEST' in os.environ:

            TimerBucketsBorg._shared_state = {}  # reset the Borg
            gpkg = os.environ['GPKG_TEST']

            table_name = 'DEBUG_TABLE'
            conn = sqlite3.connect(gpkg)
            meta1 = {'something': 2, 'somethingElse': "DUMB"}

            my_buckets = TimerBuckets(meta=meta1, table_name=table_name)

            with TimerBuckets('key1'):
                sleep(0.002)

            with TimerBuckets('key1'):
                sleep(0.002)

            with TimerBuckets('key2'):
                sleep(0.003)
            my_buckets.tick()

            my_buckets.write_sqlite(conn)

            # Second write should replace the table
            my_buckets.write_sqlite(conn)

            curs = conn.cursor()
            rows = curs.execute(f'SELECT * FROM {table_name}').fetchall()
            self.assertListEqual(rows, [
                (0, 2, 'DUMB', 0.0, 0.0, 0.0
                 )])

    def test_timer(self):
        """Test the Timer class"""

        tmr = Timer()
        sleep(0.001)

        self.assertGreater(tmr.elapsed(), 0.001)
