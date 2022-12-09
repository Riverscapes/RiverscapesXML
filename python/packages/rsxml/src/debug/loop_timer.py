"""_summary_
"""
import sys
import time
import shutil
import os
from src.logging.logger import Logger

# Set if this environment variable is set don't show any UI
NO_UI = os.environ.get('NO_UI') is not None


class LoopTimer:
    """Timer is good for figuring out how long loops are running
    """

    def __init__(self, name, logger=Logger("TIMER"), use_ms=False, interval=500):
        self.use_ms = use_ms
        self.logger = logger
        self.interval = 20000 if NO_UI else interval
        self.start = time.time()
        self.name = name
        self.lastupdate = time.time()
        self.visible = False
        # average
        self.total = 0
        self.ticks = 0

    def reset(self):
        """_summary_
        """
        self.start = time.time()

    def tick(self):
        """Indicate that a tick has happened
        """
        self.total += time.time() - self.start
        self.ticks += 1
        self.start = time.time()

    def print(self, mid_str=None, use_ms=False):
        """Tick Print

        Args:
            midStr (_type_, optional): _description_. Defaults to None.
            use_ms (bool, optional): _description_. Defaults to False.
        """
        if NO_UI:
            return
        if self.visible:
            self.erase()
        middle_str = "f::{midStr}" if mid_str else ""
        unit = "ms" if self.use_ms else "s"
        if self.ticks > 0:
            avg = self.total / self.ticks
            if use_ms or self.use_ms:
                avg = avg * 1000
            self.logger.debug(f"{self.name}{middle_str}:: Count: {self.ticks:,}, Total Time: {self.total:f}s, Average: {avg:f}{unit}")
        else:
            elapsed = time.time() - self.start
            if use_ms or self.use_ms:
                elapsed = elapsed * 1000
            self.logger.debug("{self.name}{middle_str}::{elapsed:f}{unit}")

    def erase(self):
        """Erase one line of output
        """
        if self.visible:
            sys.stdout.write("\033[F")  # back to previous line
            sys.stdout.write("\033[K")  # wipe line
        self.visible = False

    def progprint(self, mid_str=None):
        """_summary_

        Args:
            midStr (_type_, optional): _description_. Defaults to None.
        """
        if NO_UI:
            return
        middle_str = f"::{mid_str}" if mid_str else ""
        since_last = 1000 * (time.time() - self.lastupdate)
        unit = "ms" if self.use_ms else "s"
        if self.ticks > 0 and since_last > self.interval:
            self.erase()
            avg = self.total / self.ticks
            if self.use_ms:
                avg = avg * 1000
            t_size = shutil.get_terminal_size((80, 20))
            self.lastupdate = time.time()
            writestr = f"\rAVG_TIMER::{self.name}{middle_str}:: Count: {self.ticks:,}, Total Time: {self.total:f}s, Average: {avg:f}{unit}     \n"
            if len(writestr) > t_size.columns - 1:
                writestr = writestr[0:t_size.columns - 4] + '   \n'
            sys.stdout.write(writestr)
            sys.stdout.flush()
            self.visible = True
