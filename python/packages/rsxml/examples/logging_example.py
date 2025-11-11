"""
This is an example file that demonstrates how to use the RSXML Logger class.

Logging is really useful in console applications. 

NOTE: For QGIS plugins you should use QgsMessageLog instead of this class.

- https://qgis.org/pyqgis/3.2/core/Message/QgsMessageLog.html

"""
import tempfile
from rsxml import Logger


def main(logfile: str):
    log = Logger("Logger Test Program")

    # Set up a log file to use. As long as this is called early enough
    # All your log messages will be written to the file
    # Note: "mkdir -p" is assumed here so directories will be created recursively
    log.setup(log_path=logfile, verbose=True)
    # OR you can explicitly set the log level in the setup:
    # log.setup(log_path=logfile, log_level=logging.CRITICAL)

    # Explicitly set the log level later:
    # https://docs.python.org/3/library/logging.html#logging-levels
    log.setlevel("DEBUG")  # must be a valid loglevel from logging.DEBUG etc.

    log.title("This is a title message")
    log.debug("This is a debug message")
    log.debug("This is a debug message with a bunch of other stuff in it", "value1", {"can_be_dict": 23}, named_arg="named_arg", named_arg2=23, namedArg3=[1, 2, 3])
    log.info("This is an info message")
    log.warning("This is a warning message")
    log.error("This is an error message")
    log.critical("This is a critical message")

    some_other_function()


def some_other_function():
    # In the new function set up your logger with a heading
    log = Logger("some_other_function")
    log.info("This is a message from another function")


if __name__ == "__main__":
    with tempfile.NamedTemporaryFile() as f:
        print("\n\nConsole Output\n========================================================================\n")
        main(f.name)

        # Now print the log file at f
        with open(f.name, "r", encoding="utf-8") as f2:
            print("\n\nLogfile Output\n========================================================================\n")
            print(f2.read())
        pass

"""

STD::OUTPUT
========================================================================
Note: you would see this in color if you have `pip install termcolor`

[INFO] [Logger Test Program] =====================================================
[INFO] [Logger Test Program]                This is a title message               
[INFO] [Logger Test Program] =====================================================
[INFO] [Logger Test Program]  
[DEBUG] [Logger Test Program] This is a debug message
[DEBUG] [Logger Test Program] This is a debug message with a bunch of other stuff in it
              value1
              {'can_be_dict': 23}
              named_arg: named_arg
              named_arg2: 23
              namedArg3: [1, 2, 3]
[INFO] [Logger Test Program] This is an info message
[WARNING] [Logger Test Program] This is a warning message
[ERROR] [Logger Test Program] This is an error message
[CRITICAL] [Logger Test Program] This is a critical message
[INFO] [some_other_function] This is a message from another function

Logfile Output
========================================================================

2023-07-07 09:02:01,060 INFO     [Logger Test Program] =====================================================
2023-07-07 09:02:01,060 INFO     [Logger Test Program]                This is a title message               
2023-07-07 09:02:01,060 INFO     [Logger Test Program] =====================================================
2023-07-07 09:02:01,060 INFO     [Logger Test Program]  
2023-07-07 09:02:01,060 DEBUG    [Logger Test Program] This is a debug message
2023-07-07 09:02:01,061 DEBUG    [Logger Test Program] This is a debug message with a bunch of other stuff in it
              value1
              {'can_be_dict': 23}
              named_arg: named_arg
              named_arg2: 23
              namedArg3: [1, 2, 3]
2023-07-07 09:02:01,061 INFO     [Logger Test Program] This is an info message
2023-07-07 09:02:01,061 WARNING  [Logger Test Program] This is a warning message
2023-07-07 09:02:01,061 ERROR    [Logger Test Program] This is an error message
2023-07-07 09:02:01,061 CRITICAL [Logger Test Program] This is a critical message
2023-07-07 09:02:01,061 INFO     [some_other_function] This is a message from another function



"""
