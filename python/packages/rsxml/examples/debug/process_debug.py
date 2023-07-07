"""
This is an example of how to use the debug module to debug a process.

Debugging runs your code in a separate process and monitors it's memory and CPU usage.

You pass in a handle to a csv file and you get a csv file back with the process usage.

If you have matplotlib installed you will get a graph of the process usage in png format.

Note: You need to install psutil and matplotlib `pip install psutil matplotlib` for this to work.

"""
from time import sleep
import tempfile
from rsxml import Logger, debug


def my_work_method(some_text_arg: str):
    """This is the work method I'm trying to debug

    Args:
        some_text_arg (str): _description_
    """
    log = Logger('my_work_method')
    log.info(some_text_arg)
    sleep(10)


if __name__ == '__main__':
    logmain = Logger('main')

    # Usully you'd get these from argparse
    SOME_TEXT_ARG = 'This is some text'
    DEBUG = True

    # Temporary files are just for this example
    with tempfile.NamedTemporaryFile(suffix='.csv') as f:

        # Here we make a choice to either run our work method normally or in debug mode
        if DEBUG is True:
            # Do the import here so it doesn't cause any errors if we're not debugging
            retcode, max_obj = debug.thread_run(my_work_method, f.name, SOME_TEXT_ARG)
            # It returns some useful information
            logmain.info('Return code: {}, [Max process usage] {}'.format(retcode, max_obj))
        else:
            my_work_method(SOME_TEXT_ARG)

# OUTPUT: STDOUT
# =========================================================================================================
# [info] [main] Return code: None, [Max process usage] datetime: 2022-12-09 11:19:56, cpu_percent: 3, mem_resident: 38.58Mb, mem_virtual: 399445.25Mb, num_children: 0, mem_children_resident: 38.58Mb, mem_children_virtual: 399445.25Mb

# OUTPUT: CSV for importing into your favourite spreadsheet
# =========================================================================================================
# datetime,cpu_percent,resident_memory,virtual_memory,children,children_resident,children_virtual
# 2022-12-09 11:19:56,0,37.14,399045.25,0,37.14,399045.25
# 2022-12-09 11:19:57,1,37.59,399045.25,0,37.59,399045.25
# 2022-12-09 11:19:58,3,38.06,399181.25,0,38.06,399181.25
# 2022-12-09 11:19:59,1,38.12,399309.25,0,38.12,399309.25
# 2022-12-09 11:20:00,3,38.12,399309.25,0,38.12,399309.25
# 2022-12-09 11:20:01,3,38.58,399445.25,0,38.58,399445.25
# 2022-12-09 11:20:02,2,38.58,399445.25,0,38.58,399445.25
# 2022-12-09 11:20:03,3,38.58,399445.25,0,38.58,399445.25
# 2022-12-09 11:20:04,2,38.58,399445.25,0,38.58,399445.25
# 2022-12-09 11:20:05,1,38.58,399445.25,0,38.58,399445.25

# OUTPUT: PNG of the memory usage
# =========================================================================================================
# (Not pictured)
# If you have matplotlib installed you will see a file beside your CSV file called "SAMENAMNe.png"
