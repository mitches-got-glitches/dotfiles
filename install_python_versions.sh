#!/bin/bash
# Default value
n_vers=1

show_help() {
  echo "Install the latest patch for last n minor Python versions."
  echo
  echo "Usage: "$(basename "$0")" [-h] n"
  echo "Options:"
  echo "  -h, --help     Display this help message"
  echo "  n              Number of minor versions to install"
  exit 0
}

# Parse command-line options
while getopts "h" opt; do
  case $opt in
    h) show_help ;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
  esac
done

# Replace default with first posarg.
if ! [ -z "$1" ]; then
  n_vers=$1
fi

# Install the latest patch for last n minor Python versions.
py_versions=$(pyenv install --list | grep -v '[a-z]' | grep -Po '\d+\.\d+' | uniq | tail -$n_vers | tac)
for ver in $py_versions; do pyenv install $(pyenv install --list | grep $ver | grep -v '[a-z]' | tail -1); done
# Set the global Python as the most recent
latest_py=$(pyenv versions | grep -Po '\d+\.\d+\.\d+' | tail -1)
pyenv global $latest_py
