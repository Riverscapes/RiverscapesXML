"""
This is an example file that demonstrates how to use the progress bar that
comes with RS XML.

NOTE: In QGIS you should probably use QgsMessageBar or QgsTask's async methods

- https://qgis.org/pyqgis/3.0/core/Task/QgsTask.html
- https://api.qgis.org/api/classQgsMessageBar.html

"""
import random
from time import sleep
from rsxml import ProgressBar, Logger


def main():
    """Progress Bars

    Progress Bars are good for giving the user feedback during a long process
    This is just the simplest way to use them. There are several advanced cases as well
    """
    log = Logger('progressbar demo')
    log.info('Starting')

    # fill an array with 100 random floating point numbers between 0.1 and 0.5
    work_arr = [random.uniform(0.1, 0.5) for _ in range(100)]

    # Create a progress bar that's 50 characters wide with the title 'Progress Bar'
    # with values from 0 to len(work_arr)
    _prg = ProgressBar(len(work_arr), 50, 'Progress Bar')
    for progress, work_item in enumerate(work_arr, start=1):
        _prg.update(progress)

        if progress == 9:
            # Pretend element 9 has an error
            _prg.erase()  # we erase a line of stdout so that the progress bar doesn't get doubled in the terminal
            log.error('Error at element 9')

        # OUTPUT: STDOUT
        # [info] [progressbar demo] Starting
        # [error] [progressbar demo] Error at element 9
        # [=====                                             ]  11 / 100  Progress Bar (elapsed: 34.0 seconds)

        # The progress bar itself should NOT appear in any log files when using our Logger class
        # however if you're reading logs from a service like Cloudwatch that captures STDOUT
        # you may still see them. This can be mitigated by using the NO_UI environment variable
        # Which will reduce the amount of noise in the terminal and only print every 20 seconds
        sleep(work_item)

    # Finish just prints a nice summary of the progress bar. This WILL appear in the log files
    _prg.finish()

    # OUTPUT:
    # [info] [Progress Bar] Completed 100 operations.  Total Time: 30.0 seconds


if __name__ == '__main__':
    main()
