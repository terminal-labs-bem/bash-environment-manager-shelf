import os
import site
import tempfile
import configparser

_lib = "lib.py"
_shm = "/dev/shm"
_tests = "tests"
_back = ".."
_blank = ""

with open(os.path.dirname(__file__) + "/" + _lib) as f:
    code = compile(f.read(), _lib, "exec")
    exec(code)

with open(_find_local_file()) as f:
    code = compile(f.read(), "local.py", "exec")
    exec(code)

config = configparser.ConfigParser()
config.read(_find_config_file())

VERSION = config["metadata"]["version"]
NAME = config["metadata"]["name"]

PACKAGENAME = NAME
PACKAGEDIR = os.path.abspath(os.path.dirname(_find_config_file()))
FRAMEWORKDIR = os.path.abspath(os.path.dirname(__file__))
SRCDIR = os.path.abspath(os.path.join(FRAMEWORKDIR, _back))
APPDIR = os.path.abspath(os.path.join(FRAMEWORKDIR, _back))
SETUPFILEDIR = os.path.abspath(os.path.join(APPDIR, _back))
TESTDIR = os.path.abspath(os.path.join(APPDIR, "tests"))
if os.path.isdir(_shm):
    MEMTEMPDIR = _shm
    tempfile.tempdir = MEMTEMPDIR
else:
    MEMTEMPDIR = _blank
SITEPACKAGESPATH = site.getsitepackages()[0]
COVERAGERC_PATH = f"{APPDIR}/.coveragerc"

PROJECT_NAME = NAME

VARS = {
    "VERSION": VERSION,
    "NAME": NAME,
    "FRAMEWORK_VERSION": FRAMEWORK_VERSION,
    "PROJECT_NAME": PROJECT_NAME,
    "PRINT_VERBOSITY": PRINT_VERBOSITY,
    "EXCLUDED_DIRS": EXCLUDED_DIRS,
    "TEMPDIR": TEMPDIR,
    "DIRS": DIRS,
    "TEXTTABLE_STYLE": TEXTTABLE_STYLE,
    "MINIMUM_PYTHON_VERSION": MINIMUM_PYTHON_VERSION,
    "COVERAGERC_PATH": COVERAGERC_PATH,
    "PACKAGENAME": PACKAGENAME,
    "PACKAGEDIR": PACKAGEDIR,
    "FRAMEWORKDIR": FRAMEWORKDIR,
    "SRCDIR": SRCDIR,
    "APPDIR": APPDIR,
    "SETUPFILEDIR": SETUPFILEDIR,
    "MEMTEMPDIR": MEMTEMPDIR,
    "SITEPACKAGESPATH": SITEPACKAGESPATH,
    "CONFIG": config._sections
}
