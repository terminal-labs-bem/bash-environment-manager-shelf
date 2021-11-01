import os
import site
import tempfile
import configparser
import importlib.util

_lib = "lib.py"
_shm = "/dev/shm"
_tests = "tests"
_back = ".."
_blank = ""

def import_mod_from_fp(module_name, filepath):
    spec = importlib.util.spec_from_file_location(module_name, filepath)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

_fw = import_mod_from_fp('fw_lib', os.path.dirname(__file__) + "/" + _lib)
_local = import_mod_from_fp('local', _fw.find_local_file())

config = configparser.ConfigParser()
config.read(_fw.find_config_file())

VERSION = config["metadata"]["version"]
NAME = config["metadata"]["name"]

PACKAGENAME = NAME
PACKAGEDIR = os.path.abspath(os.path.dirname(_fw.find_config_file()))
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
    "FRAMEWORK_VERSION": _local.FRAMEWORK_VERSION,
    "PROJECT_NAME": PROJECT_NAME,
    "PRINT_VERBOSITY": _local.PRINT_VERBOSITY,
    "EXCLUDED_DIRS": _local.EXCLUDED_DIRS,
    "TEMPDIR": _local.TEMPDIR,
    "DIRS": _local.DIRS,
    "TEXTTABLE_STYLE": _local.TEXTTABLE_STYLE,
    "MINIMUM_PYTHON_VERSION": _local.MINIMUM_PYTHON_VERSION,
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
