## Setup 
#
# Shell-agnostic way to find path to this script when source'd
#     Derived from https://unix.stackexchange.com/a/351658
if test -n "$BASH" ; then script=$BASH_SOURCE
elif test -n "$TMOUT"; then script=${.sh.file}
elif test -n "$ZSH_NAME" ; then script=${(%):-%x}
elif test ${0##*/} = dash; then x=$(lsof -p $$ -Fn0 | tail -1); script=${x#n}
else script=$0
fi
script_dir="$(cd "$(dirname "$script")"; pwd)"

## Conan Settings
#
export SRCROOT="${script_dir}"
export CONAN_USER_HOME="${SRCROOT}"
export PATH=$(./conanw --cw-dir):$PATH