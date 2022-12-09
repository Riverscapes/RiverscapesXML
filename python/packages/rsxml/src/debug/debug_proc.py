from __future__ import annotations
import math
import csv
import os
from datetime import datetime
from concurrent.futures import ThreadPoolExecutor
from time import sleep
# Make sure this module doesn't crash if these aren't installed.
try:
    import psutil
except ImportError:
    psutil = None
try:
    import matplotlib.pyplot as plt
except ImportError:
    plt = None
from src.logging.logger import Logger

# https://medium.com/survata-engineering-blog/monitoring-memory-usage-of-a-running-python-program-49f027e3d1ba


class ProcStats():
    """_summary_

    Returns:
        _type_: _description_
    """
    headers = ['datetime', 'cpu_percent', 'resident_memory', 'virtual_memory', 'children', 'children_resident', 'children_virtual']

    def __init__(self, cpu_percent, rss_raw: int, vms_raw: int, children: int, children_rss_raw: int, children_vms_raw: int):
        """_summary_

        Args:
            cpu_percent (_type_): _description_
            rss_raw (int): _description_
            vms_raw (int): _description_
            children (int): _description_
            children_rss_raw (int): _description_
            children_vms_raw (int): _description_
        """
        self.datetime = datetime.now()
        self.cpu_percent = cpu_percent
        self.children = children
        self.rss = rss_raw / float(2 ** 20)
        self.vms = vms_raw / float(2 ** 20)
        self.children_rss = children_rss_raw / float(2 ** 20)
        self.children_vms = children_vms_raw / float(2 ** 20)

    def row(self):
        """_summary_

        Returns:
            _type_: _description_
        """
        return [
            self.datetime.strftime('%Y-%m-%d %H:%M:%S'),
            math.ceil(self.cpu_percent),
            f"{self.rss:.2f}",
            f"{self.vms:.2f}",
            f"{self.children}",
            f"{self.rss:.2f}",
            f"{self.vms:.2f}"
        ]

    def toString(self) -> str:
        """_summary_

        Returns:
            _type_: _description_
        """
        return f"datetime: {self.datetime.strftime('%Y-%m-%d %H:%M:%S')}, cpu_percent: {math.ceil(self.cpu_percent)}, mem_resident: {self.rss:.2f}Mb, mem_virtual: {self.vms:.2f}Mb, num_children: {self.children}, mem_children_resident: {self.rss:.2f}Mb, mem_children_virtual: {self.vms:.2f}Mb"

    def max(self, tick: ProcStats):
        """_summary_

        Args:
            tick (ProcStats): _description_
        """
        self.cpu_percent = max(self.cpu_percent, tick.cpu_percent)
        self.children = max(self.children, tick.children)
        self.rss = max(self.rss, tick.rss)
        self.vms = max(self.vms, tick.vms)
        self.children_rss = max(self.children_rss, tick.children_rss)
        self.children_vms = max(self.children_vms, tick.children_vms)


class MemoryMonitor:
    """_summary_
    """

    def __init__(self, logfile: str, loop_delay=1):
        if not psutil:
            return
        self.keep_measuring = True
        self.filepath = logfile
        self.loop_delay = loop_delay
        self.process = psutil.Process(os.getpid())
        self.headers_written = False
        self.max_stats = ProcStats(0, 0, 0, 0, 0, 0)

    def write_line(self, arr, mode='a'):
        """_summary_

        Args:
            arr (_type_): _description_
            mode (str, optional): _description_. Defaults to 'a'.
        """
        with open(self.filepath, mode, newline='', encoding='utf-8') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow(arr)

    def getstats(self) -> ProcStats:
        """_summary_

        Returns:
            ProcStats: _description_
        """
        cpu_percent = self.process.cpu_percent()
        mem_info = self.process.memory_info()
        children = 0
        children_rss = 0
        children_vms = 0

        for child in self.process.children():
            child_mem = child.memory_info()
            children_rss += child_mem.rss
            children_vms += child_mem.vms
            children += 1

        stats = ProcStats(cpu_percent, mem_info.rss, mem_info.vms, children, children_rss, children_vms)
        self.max_stats.max(stats)
        return stats

    def measure_usage(self):
        """_summary_

        Returns:
            _type_: _description_
        """
        self.write_line(ProcStats.headers, 'w')
        while self.keep_measuring:
            self.write_line(self.getstats().row())
            sleep(self.loop_delay)
        return self.max_stats

    def write_plot(self, imgpath: str):
        """_summary_

        Args:
            imgpath (str): _description_
        """
        log = Logger('write_plot')
        if not plt:
            log.error('You need Matplotlib to run write_plot')
            return
        x = []
        data = {}
        with open(self.filepath, encoding='utf8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                for key in row.keys():
                    if key == 'datetime':
                        x.append(row[key])
                    else:
                        if key in ['children', 'cpu_percent']:
                            val = int(row[key])
                        else:
                            val = float(row[key])
                        if key not in data:
                            data[key] = [val]
                        else:
                            data[key].append(val)

        chart_title = 'Process stats'
        xlabel = 'time'
        ylabel = 'Mb'

        plt.clf()

        fig, plt_ax = plt.subplots()
        plt_ax.title.set_text(chart_title)
        ax2 = plt_ax.twinx()
        #  ['datetime', 'cpu_percent', 'resident_memory', 'virtual_memory', 'children', 'children_resident', 'children_virtual']
        for key in ['children_resident', 'children_virtual', 'resident_memory', 'virtual_memory']:
            if key in data:
                plt_ax.plot(x, data[key], label=key)
            ax2._get_lines.get_next_color()

        plt_ax.set_xlabel(xlabel)
        plt_ax.set_ylabel(ylabel)

        for key in ['cpu_percent', 'children']:
            if key in data:
                ax2.plot(x, data[key], label=key)

        plt_ax.legend(loc='lower left')
        ax2.legend(loc='lower right')

        freq = math.floor(len(x) / 10)
        if freq == 0:
            freq = 1
        plt_ax.set_xticks(x[::freq])
        plt_ax.set_xticklabels(x[::freq], rotation=45)
        plt_ax.grid(True)

        # plt.tight_layout()
        fig.set_size_inches(8, 6)
        fig.savefig(imgpath, format='png', dpi=300)


def thread_run(callback, memlogfile: str, *args, **kwargs):
    """_summary_

    Args:
        callback (function): _description_
        memlogfile (str): _description_

    Returns:
        _type_: _description_
    """
    log = Logger('Debug')
    if not psutil:
        log.error('You need "psutil" to run the debug tools')
        return

    memmon = MemoryMonitor(memlogfile, 1)
    result = None
    max_obj = None
    try:
        with ThreadPoolExecutor() as executor:
            mem_thread = executor.submit(memmon.measure_usage)
            try:
                fn_thread = executor.submit(callback, *args, **kwargs)
                result = fn_thread.result()
            except Exception as err_in:
                log.error(f"Error executing code: {err_in}")
            finally:
                memmon.keep_measuring = False
                max_obj = mem_thread.result()
                log.debug(f'MaxStats: {max_obj}')
    except Exception as err_out:
        # Make sure we always return so that we don't have to debug our debugger
        log.error(err_out)
    try:
        memmon.write_plot(os.path.splitext(memlogfile)[0] + '.png')
    except Exception as err:
        log.error(f'Error Writing memory plot: {err}')

    ret_val = max_obj.toString() if max_obj is not None else "process no longer exists"
    return result, ret_val
