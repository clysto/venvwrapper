# VENVWRAPPER

This is a very simple tool which help you manage your Python virtual environments more smoothly☺️!

**It can only manage the virtual environments created by the python venv module. If you are using virtualenv to create virtual environments, you should use virtualenvwrapper.**

## Install

Clone the repo:

```bash
git clone https://github.com/clysto/venvwrapper $HOME/.venvwrapper
```

Add this lines to your `.zshrc/.bashrc`

```
export VENVWRAPPER_PYTHON="python3"
export VENVWRAPPER="$HOME/.venvwrapper"
source $HOME/.venvwrapper/venvwrapper.sh
```

> You can use `VENVWRAPPER_PYTHON` environment variable to specify the python version. For example, you want to use Python3.8 to create venv:
> ```
> export VENVWRAPPER_PYTHON="/usr/local/opt/python@3.8/bin/python3"
> ```

## Usage

All virtual environments are stored in the `$VENVWRAPPER_PYTHON/venvs` folder by default. You can change this default behavior by setting the `VENV_HOME` environment variable.

```bash
# activate a venv
venv activate <VENV>
# list all venv
venv list
# create a new venv
venv create <VENV>
# remove a venv
venv remove <VENV>
```
