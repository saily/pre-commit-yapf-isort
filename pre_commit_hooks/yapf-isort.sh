#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset



DEBUG=${DEBUG:=0}
[[ $DEBUG -eq 1 ]] && set -o xtrace

# check if classic virtualenv is used
echo 'Check virtualenv'
if [ -f bin/activate ]; then
  source bin/activate
fi

# check if virtualenvwrapper is used
echo 'Check virtualenvwrapper'
if [ ! -z "${WORKON_HOME}" ] && [ -f "${WORKON_HOME}/${PWD##*/}" ]; then
  if ! which workon &>/dev/null; then
    >&2 echo 'workon command not found'
    exit 1
  fi
  workon "${PWD##*/}"
fi

echo 'Begin yapf'
if ! which yapf &>/dev/null; then
  >&2 echo 'yapf command not found'
  exit 1
fi
yapf -i -vv "$@"

echo 'Begin isort'
if ! which isort &>/dev/null; then
  >&2 echo 'isort command not found'
  exit 1
fi
isort -ac "$@"
