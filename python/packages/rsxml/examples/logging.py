from rsxml import Logger
import tempfile


def main(logfile: str):
    log = Logger("Logger Test Program")

    # Set up a log file to use. As long as this is called early enough
    # All your log messages will be written to the file
    # Note: "mkdir -p" is assumed here so directories will be created recursively
    log.setup(log_path=logfile, verbose=True)

    # Explicitly set the log level]
    log.setlevel("DEBUG")  # must be in ["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"]

    log.title("This is a title message")
    log.debug("This is a debug message")
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
        main(f.name)
        pass

"""

STD::OUTPUT
========================================================================
Note: you would see this in color if you have `pip install termcolor`

[info] [Logger Test Program] =====================================================
[info] [Logger Test Program]                This is a title message               
[info] [Logger Test Program] =====================================================
[info] [Logger Test Program]  
[debug] [Logger Test Program] This is a debug message
[info] [Logger Test Program] This is an info message
[warning] [Logger Test Program] This is a warning message
[error] [Logger Test Program] This is an error message
[critical] [Logger Test Program] This is a critical message
[info] [some_other_function] This is a message from another function

Logfile Output
========================================================================

2022-12-09 10:10:01,467 INFO     [Logger Test Program] =====================================================
2022-12-09 10:10:01,467 INFO     [Logger Test Program]                This is a title message               
2022-12-09 10:10:01,467 INFO     [Logger Test Program] =====================================================
2022-12-09 10:10:01,467 INFO     [Logger Test Program]  
2022-12-09 10:10:01,467 DEBUG    [Logger Test Program] This is a debug message
2022-12-09 10:10:01,467 INFO     [Logger Test Program] This is an info message
2022-12-09 10:10:01,467 WARNING  [Logger Test Program] This is a warning message
2022-12-09 10:10:01,468 ERROR    [Logger Test Program] This is an error message
2022-12-09 10:10:01,468 CRITICAL [Logger Test Program] This is a critical message
2022-12-09 10:10:01,468 INFO     [some_other_function] This is a message from another function


"""
