import pathlib
import configparser
from pathlib import Path
from os.path import join, basename, abspath, isfile, dirname

config = configparser.ConfigParser()

package_link = ".tmp/symlink"
_setuppy = "/setup.py"
_setupcfg = "/setup.cfg"
_dsstore = ".DS_Store"
_repo = "repo"
_back = ".."
_blank = ""
_slash = "/"
_path = str(pathlib.Path(__file__).parent.absolute())

def _cwd():
    return join(dirname(__file__))

def _join(a, b):
    return abspath(join(a, b))

def _split(a):
    return a.split(_slash)

def _backout(path):
    return _join(path, _back)

def _import_fun(mod, func):
    return getattr(__import__(mod, fromlist=[func]), func)

def _get_pgk_dir():
    currentpath = _cwd()
    i = len(currentpath.split(_slash))
    while i > 0:
        currentpath = _join(currentpath, _back)
        if isfile(currentpath + _setuppy):
            return currentpath
            i = -1
        i = i - 1


def _find_file(name, path):
    for root, dirs, files in os.walk(path):
        if name in files:
            return os.path.join(root, name)


def _find_src_dir():
    currentpath = _cwd()
    currentpath = currentpath.split(_slash)
    currentpath.reverse()
    build_new_path = False
    new_path = []
    for dir in currentpath:
        if dir == "src":
            build_new_path = True
        if build_new_path == True:
            new_path.append(dir)
    new_path.reverse()
    return "/".join(new_path)


def _find_config_file():
    currentpath = _cwd()
    currentpath = currentpath.split(_slash)
    currentpath.reverse()
    search = currentpath[:]
    for dir in currentpath:
        search.pop(0)
        candidate = search[:]
        candidate.reverse()
        if _find_file("setup.cfg", "/".join(candidate)):
            return _find_file("setup.cfg", "/".join(candidate))

def _find_local_file():
    currentpath = _cwd()
    currentpath = currentpath.split(_slash)
    currentpath.reverse()
    search = currentpath[:]
    for dir in currentpath:
        search.pop(0)
        candidate = search[:]
        candidate.reverse()
        if _find_file("local.py", "/".join(candidate)):
            return _find_file("local.py", "/".join(candidate))


def _is_install_editable():
    if _find_src_dir() == "":
        return False
    else:
        return True

def _get_pgk_name():
    config.read(_find_config_file())
    NAME = config["metadata"]["name"]
    return NAME

def setup_links(package_name):
    _link = package_link + _slash
    Path(_path + _slash + _link).mkdir(parents=True, exist_ok=True)
    if not os.path.islink(_path + _slash + _link + package_name):
        os.symlink(os.path.join(_path, _src), _path + _slash + _link + _slash + package_name)

def smart_reqs(repos, package_name):
    # styles = standalone, repo
    currentpath = _path
    def _get_deploy_style():
        currentpath = _path
        for _ in range(len(_split(currentpath))):
            currentpath = _backout(currentpath)
            if isdir(currentpath + _slash + ".tmp" + _slash + _repo):
                return _repo

    if _get_deploy_style() == _repo:
        local_repos = os.listdir(_join(_path, _back))
        if _dsstore in local_repos:
            local_repos.remove(_dsstore)
        if package_name in local_repos:
            local_repos.remove(package_name)
        for repo in local_repos:
            repos = [_ for _ in repos if not _.endswith(repo + ".git")]
        return repos
    return repos
