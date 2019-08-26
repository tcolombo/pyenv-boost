#!/bin/bash
# Pyenv-boost installer

set -eo pipefail

readonly FILES=('pyenv-new' 'pyenv-history' 'pyenv-clean')

if [ -z "${PYENV_ROOT}" ]; then
    if [ -d "${HOME}/.pyenv" ]; then
        PYENV_ROOT="${HOME}/.pyenv"
    else
        echo "Pyenv not found !"
        echo "If Pyenv is installed on your system, call installer with PYENV_ROOT:"
        echo 'PYENV_ROOT="~/myDirectory" install.sh'
        exit 1
    fi
fi

for file in ${FILES[@]}; do
    curl -L https://raw.githubusercontent.com/tcolombo/pyenv-boost/master/${file} > ${PYENV_ROOT}/bin/${file}
    chmod u+x ${PYENV_ROOT}/bin/${file}
done

mkdir ${PYENV_ROOT}/data
curl -L https://raw.githubusercontent.com/tcolombo/pyenv-boost/master/data/pip > ${PYENV_ROOT}/data/pip
chmod u+x ${PYENV_ROOT}/data/pip

echo 'Installation completed successfully'
