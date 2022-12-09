from __future__ import annotations
import time
from src.util import pretty_duration


class Timer:
    """_summary_
    """

    def __init__(self):
        """_summary_
        """
        self._start_time = None
        self._stop_time = None
        self.reset()

    def reset(self):
        """_summary_
        """
        self._start_time = time.perf_counter()
        self._stop_time = None

    def toString(self) -> str:
        """_summary_

        Returns:
            str: _description_
        """
        return pretty_duration(self.ellapsed())

    def ellapsed(self) -> int:
        """_summary_

        Returns:
            int: _description_
        """
        self._stop_time = time.perf_counter()
        return self._stop_time - self._start_time


class TimerWaypoints:
    """_summary_
    """

    def __init__(self):
        """_summary_
        """
        self.timer = Timer()
        self.timers = []
        self.total_time = 0

    def timer_break(self, key: str):
        """_summary_

        Args:
            key (str): _description_
        """
        ellapsed = self.timer.ellapsed()
        self.timers.append((key, ellapsed))
        self.total_time += ellapsed
        self.timer.reset()

    def toString(self) -> str:
        """_summary_

        Returns:
            str: _description_
        """
        return '-----------------------------------\n' \
            + '\n'.join([f'{x}: {round(ell)} seconds' for x, ell in self.timers]) \
            + '\n-----------------------------------\n' \
            + f'total: {round(self.total_time, 3)} seconds' \
            '\n-----------------------------------\n'
