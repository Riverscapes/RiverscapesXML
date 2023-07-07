"""
This is an example file demonstrating how to use various different
types of timers that come with RSXML

Timers are really useful for debugging why your code is slow. You can also use them
to time how long it takes to do something and then write the results to a csv file.

"""
from time import sleep
import tempfile
import sqlite3
from rsxml.debug import Timer, LoopTimer, TimerBuckets, TimerWaypoints
from rsxml import Logger


def simple():
    """
    Basic Timer

    This is a really simple timer with a date subtraction. 
    """
    log = Logger('Simple Timer')
    # Here is a basic timer. Define it and then call elapsed() to get the time
    _tmr = Timer()
    sleep(1)

    log.info(f'Timer: {_tmr.elapsed()}')
    # [info] [Simple Timer] Timer: 1.0054419169900939

    log.info(f'Timer: {_tmr.toString()}')
    # [info] [Simple Timer] Timer: 1.0 seconds


def loop_timer():
    """
    Loop Timer

    Loop timers are useful for debugging why for loops are taking so long. 
    """
    log = Logger('Loop Timer')
    _lt = LoopTimer('My Loop Timer', log)
    for _i in range(10):
        _lt.tick()  # Signal to the loop timer that one iteration has happened
        _lt.progprint()  # print the current status of the loop timer continuously to the loop
        sleep(1)  # here's the work we're doing

        # OUTPUT:
        # > AVG_TIMER::My Loop Timer:: Count: 6, Total Time: 5.019857s, Average: 0.836643s


def timer_buckets(csv_file: str):
    """
    Timer Buckets

    This is a much more advanced loop timer. It allows you to track multiple timers at once.
    Also you can append arbitrary columns of metadata and then write to either a csv file or
    a database table (including Geopackage support without OGR)

    You can also use "with" statements to automatically start and stop timers.
    everything inside the with statement will be counted as part of the timer.
    """
    _tmr_buckets = TimerBuckets(table_name="debug_table", csv_path=csv_file)
    conn = sqlite3.connect(':memory:')

    for i in range(10):
        arbitrary_columns = {'something': i, 'something_else': f"KEY {i}"}
        _tmr_buckets.tick(arbitrary_columns)

        with TimerBuckets('key1'):
            sleep(0.2)

        with TimerBuckets('key1'):
            sleep(0.1)

        with TimerBuckets('key2'):
            sleep(0.15)

    _tmr_buckets.write_csv(csv_file)
    # OUTPUT CSV:

    # tick,something,something_else,tmr_key1,tmr_key2,timer_total
    # 0,0,KEY 0,0.3,0.2,0.5
    # 1,1,KEY 1,0.3,0.2,0.5
    # 2,2,KEY 2,0.3,0.2,0.5
    # 3,3,KEY 3,0.3,0.2,0.5
    # 4,4,KEY 4,0.3,0.2,0.5
    # 5,5,KEY 5,0.3,0.2,0.5
    # 6,6,KEY 6,0.3,0.2,0.5
    # 7,7,KEY 7,0.3,0.2,0.5
    # 8,8,KEY 8,0.3,0.2,0.5
    _tmr_buckets.write_sqlite(conn)


def timer_waypoints():
    """
    Timer Waypoints

    Waypoints are a way to track the time between points in your code.
    Think of them like lap markers.
    """
    log = Logger('Timer Waypoints')
    log.setlevel('DEBUG')

    _tmr_waypoints = TimerWaypoints()

    sleep(1)
    _tmr_waypoints.timer_break('first thing')

    sleep(3)
    _tmr_waypoints.timer_break('second thing')

    sleep(2)
    _tmr_waypoints.timer_break('third thing')

    log.info(_tmr_waypoints.toString())

    # [info] [Timer Waypoints]
    #    -----------------------------------
    #      first thing: 1 seconds
    #      second thing: 3 seconds
    #      third thing: 2 seconds
    #    -----------------------------------
    #      total: 6.013 seconds
    #    -----------------------------------


if __name__ == "__main__":
    simple()
    loop_timer()

    with tempfile.NamedTemporaryFile(suffix='.csv') as f:
        timer_buckets(f.name)

    timer_waypoints()
