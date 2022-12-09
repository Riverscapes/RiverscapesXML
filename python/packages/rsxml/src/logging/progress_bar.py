import sys
import time
import shutil
import os
from src.logging.logger import Logger
from src.util import sizeof_fmt, pretty_duration

# Set if this environment variable is set don't show any UI
NO_UI = os.environ.get('NO_UI') is not None


class ProgressBar:
    """Progress Bar is good for giving the user feedback during a long process
    """

    def __init__(self, total, char_size=50, text=None, timer=500, byte_format=False):
        self.char_size = char_size
        self.text = text
        self.byte_format = byte_format
        self.start_time = None
        self.lastupdate = time.time()
        self.timer = 20000 if NO_UI else timer
        self.progress = 0
        self.visible = False
        self.total = total if total > 0 else 1

    def update(self, progress):
        """_summary_

        Args:
            progress (_type_): _description_
        """
        self.progress = progress
        self.output()

    def erase(self):
        """_summary_
        """
        if NO_UI:
            return
        if self.visible:
            sys.stdout.write("\033[F")  # back to previous line
            sys.stdout.write("\033[K")  # wipe line
        self.visible = False

    def finish(self):
        if (self.start_time is None):
            duration = "0s"
        else:
            duration = pretty_duration(int(time.time() - self.start_time))
        if self.byte_format:
            writestr = "Completed: {}  Total Time: {}     \n".format(sizeof_fmt(self.total), duration)
        else:
            writestr = "Completed {:,} operations.  Total Time: {}     \n".format(self.total, duration)
        log = Logger(self.text)
        log.info(writestr)

    def output(self):
        first_time = False
        if self.start_time is None:
            first_time = True
            self.start_time = time.time()
        elapsed_time = 1000 * (time.time() - self.lastupdate)
        dur_s = int(time.time() - self.start_time)
        duration = pretty_duration(dur_s)
        # For NO_UI we still want a keepalive signal but we don't want the quick-update progress bars
        if NO_UI:
            if first_time or elapsed_time > self.timer:
                self.lastupdate = time.time()
                writestr = ""

                if self.byte_format:
                    writestr = f"        PROGRESS: {sizeof_fmt(self.progress)} / {sizeof_fmt(self.total)}    {self.text}     (elapsed: {duration})\n"
                else:
                    pct_done = int(100 * (self.progress / self.total))
                    writestr = f"        PROGRESS: {self.progress:,} / {self.total:,}  ({pct_done}%)  {self.text}     (elapsed: {duration})\n"
                sys.stdout.write(writestr)
                sys.stdout.flush()
            return
        if first_time or elapsed_time > self.timer:
            t_size = shutil.get_terminal_size((80, 20))
            self.lastupdate = time.time()
            done = 0
            if self.total > 0:
                done = int(50 * self.progress / self.total)
            self.erase()
            writestr = ""
            linebar = '=' * done
            spacepad = ' ' * (50 - done)
            if self.byte_format:
                writestr = f"\r[{linebar}{spacepad}]  {sizeof_fmt(self.progress)} / {sizeof_fmt(self.total)}  {self.text} (elapsed: {duration})     \n"
            else:
                writestr = f"\r[{linebar}{spacepad}]  {self.progress:,} / {self.total:,}  {self.text} (elapsed: {duration})     \n"

            if len(writestr) > t_size.columns - 1:
                writestr = writestr[0:t_size.columns - 4] + '   \n'

            sys.stdout.write(writestr)
            sys.stdout.flush()
            self.visible = True
