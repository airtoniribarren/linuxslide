#!/bin/sh

set -e

DIR=`realpath --no-symlinks $PWD`

# Full path of this script (https://stackoverflow.com/questions/192292/bash-how-best-to-include-other-scripts)
#THIS=`readlink -f "${BASH_SOURCE[0]}" 2>/dev/null||echo $0`
# This directory path
#DIR=`dirname "${THIS}"`
