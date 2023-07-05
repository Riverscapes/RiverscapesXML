"""

This class exists to allow us to do logging the way we want and in a consistent way

"""
# logging.getLogger("botocore").setLevel(logging.ERROR)
# logging.getLogger("requests").setLevel(logging.ERROR)
# logging.getLogger("shapely").setLevel(logging.ERROR)
# logging.getLogger("urllib3").setLevel(logging.ERROR)
# logging.getLogger("pygeoprocessing").setLevel(logging.ERROR)
# logging.getLogger("rasterio").setLevel(logging.ERROR)
import os
import logging
import logging.handlers
from pprint import pformat
# Colored is optional
try:
    from termcolor import colored
except ImportError as err:
    colored = None

# Set if this environment variable is set don't show any UI
NO_UI = os.environ.get('NO_UI') is not None


class _LoggerSingleton:
    instance = None

    class __Logger:
        """_summary_
        """

        def __init__(self):
            self.initialized = False
            self.verbose = False
            self.logpath = None
            self.handler = None
            self.logger = logging.getLogger("LOGGER")

        def setup(self, log_path=None, verbose=False, log_level: str = None):
            """_summary_

            Args:
                logPath (_type_, optional): _description_. Defaults to None.
                verbose (bool, optional): _description_. Defaults to False.
            """
            self.initialized = True
            self.verbose = verbose

            if verbose is True and log_level is not None:
                raise ValueError("Cannot set both verbose and log_level")

            loglevel = logging.INFO if not verbose else logging.DEBUG

            self.logger = logging.getLogger("LOGGER")
            self.logger.setLevel(loglevel)

            # Make sure we capture osgeo warnigns if we need to
            osgeo_logger = logging.getLogger("osgeo")
            osgeo_logger.setLevel(logging.WARNING)

            if log_path:
                self.logpath = log_path
                if not os.path.exists(os.path.dirname(log_path)):
                    os.makedirs(os.path.dirname(log_path))
                if not os.path.isdir(os.path.dirname(log_path)):
                    os.makedirs(os.path.dirname(log_path))

                self.handler = logging.FileHandler(log_path, mode='w')
                self.handler.setLevel(loglevel)
                # self.handler.
                self.handler.setFormatter(logging.Formatter('%(asctime)s %(levelname)-8s [%(curmethod)-15s] %(message)s'))
                self.handler.datefmt = '%Y-%m-%d %H:%M:%S'

                self.logger.addHandler(self.handler)

                osgeo_logger.addHandler(self.handler)

        def logprint(self, message, method="", severity="info", exception=None):
            """
            Logprint logs things 3 different ways: 1) stdout 2) log txt file 3) xml
            :param message:
            :param method:
            :param severity:
            :param exception:
            :return:
            """

            # Verbose logs don't get written until we ask for them
            if severity == 'debug' and not self.verbose:
                return

            # dateStr = datetime.datetime.now().strftime('%Y-%m-%dT%H:%M:%S%z')
            msg_arr = []
            if exception is not None:
                txtmsg = f'{message}  Exception: {str(exception)}'
                msg = f'[{severity}] [{method}] {message} : {str(exception)}'
            elif severity == 'title':
                buffer = 15
                buffer_str = buffer * ' '
                spcrbar = (len(message) + (buffer * 2)) * '='
                msg_arr = [
                    spcrbar, f'{buffer_str}{message}{buffer_str}', spcrbar, ' '
                ]
                msg = '\n'.join([f'[info] [{method}] {m}' for m in msg_arr])
            else:
                txtmsg = message
                msg = f'[{severity}] [{method}] {message}'

            # Print to stdout
            if not NO_UI or colored is None:
                if severity == 'debug':
                    msg = colored(msg, 'cyan')
                if severity == 'warning':
                    msg = colored(msg, 'yellow')
                if severity == 'error':
                    msg = colored(msg, 'red')
                if severity == 'title':
                    msg = colored(msg, 'magenta')

            print(msg)

            # If we haven't set up a logger then we're done here. Don't write to any files
            if not self.initialized:
                return

            # Write to log file
            if severity == 'info':
                self.logger.info(txtmsg, extra={'curmethod': method})
            elif severity == 'warning':
                self.logger.warning(txtmsg, extra={'curmethod': method})
            elif severity == 'error':
                self.logger.error(txtmsg, extra={'curmethod': method})
            elif severity == 'critical':
                self.logger.critical(txtmsg, extra={'curmethod': method})
            elif severity == 'debug':
                self.logger.debug(txtmsg, extra={'curmethod': method})
            elif severity == 'title':
                for msg_it in msg_arr:
                    self.logger.info(msg_it, extra={'curmethod': method})

    def __init__(self, **kwargs):
        if not _LoggerSingleton.instance:
            _LoggerSingleton.instance = _LoggerSingleton.__Logger(**kwargs)

    def __getattr__(self, name):
        return getattr(self.instance, name)


class Logger():
    """
    Think of this class like a light interface
    """

    def __init__(self, method=""):
        """

        :rtype: object
        """
        self.instance = _LoggerSingleton()
        self.method = method

    def setup(self, **kwargs):
        """_summary_
        """
        self.instance.setup(**kwargs)

    def print_(self, message, **kwargs):
        """_summary_

        Args:
            message (_type_): _description_
        """
        self.instance.logprint(message, **kwargs)

    def isverbose(self):
        """_summary_

        Returns:
            _type_: _description_
        """
        return self.instance.verbose

    def setlevel(self, log_level: str):
        """Set the level of the logger

        Args:
            level (_type_): _description_
        """
        self.instance.logger.setLevel(logging.getLevelName(log_level))

    def debug(self, *args):
        """
        This works a little differently. You can basically throw anything you want into it.
        :param message:
        :return:
        """
        msgarr = []
        for arg in args:
            if isinstance(arg, str):
                msgarr.append(arg)
            else:
                msgarr.append(pformat(arg))
        finalmessage = '\n'.join(msgarr).replace('\n', '\n              ')
        self.instance.logprint(finalmessage, self.method, "debug")

    def destroy(self):
        """_summary_
        """
        self.instance = None
        self.method = None

    def info(self, message):
        """_summary_

        Args:
            message (_type_): _description_
        """
        self.instance.logprint(message, self.method, "info")

    def error(self, message, exception=None):
        """_summary_

        Args:
            message (_type_): _description_
            exception (_type_, optional): _description_. Defaults to None.
        """
        self.instance.logprint(message, self.method, "error", exception)

    def critical(self, message, exception=None):
        """_summary_

        Args:
            message (_type_): _description_
            exception (_type_, optional): _description_. Defaults to None.
        """
        self.instance.logprint(message, self.method, "critical", exception)

    def warning(self, message, exception=None):
        """_summary_

        Args:
            message (_type_): _description_
            exception (_type_, optional): _description_. Defaults to None.
        """
        self.instance.logprint(message, self.method, "warning", exception)

    def title(self, message):
        """_summary_

        Args:
            message (_type_): _description_
        """
        self.instance.logprint(message, self.method, "title")
