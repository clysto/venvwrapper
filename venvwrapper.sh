[[ -z "$VENVWRAPPER" ]] && export VENVWRAPPER="${${(%):-%x}:a:h}"

if [[ -z "$VENV_HOME" ]]; then
    VENV_HOME="$VENVWRAPPER/venvs"
fi

if [[ -z "$VENVWRAPPER_PYTHON" ]]; then
    VENVWRAPPER_PYTHON="python3"
fi

alias venv-ls=venv-list
alias venv-rm=venv-remove

venv-list() {
    ls -1 $VENV_HOME
}

venv-activate() {
    if [ $# -eq 0 ]; then
        echo -e "\e[31mError: \e[0mInvalid usage: this command requires a venv argument"
        return -1
    else
        source "$VENV_HOME/$1/bin/activate"
    fi
}

venv-create() {
    if [ $# -eq 0 ]; then
        echo -e "\e[31mError: \e[0mInvalid usage: this command requires a venv argument"
        return -1
    else
        $VENVWRAPPER_PYTHON -m venv $VENV_HOME/$1
    fi
}

venv-remove() {
    if [ $# -eq 0 ]; then
        echo -e "\e[31mError: \e[0mInvalid usage: this command requires a venv argument"
        return -1
    else
        rm -r $VENV_HOME/$1
    fi
}

venv() {
    if [ $# -eq 0 ]; then
        echo "Example usage:"
        echo "  venv activate <VENV>"
        echo "  venv list"
        echo "  venv create <VENV>"
        echo "  venv remove <VENV>"
    else
        if ! command -v venv-$1 &> /dev/null; then
            echo -e "\e[31mError: \e[0mUnknown command: $1"
            return -1
        fi
        command=$1
        shift 1
        eval "venv-$command $@"
    fi
}
