#!/bin/bash
############################################################
# Help                                                     #
############################################################
show_help() {
  echo "Install the latest patch for last n minor Python versions."
  echo
  echo "Usage: $(install_python_versions $0) [-h]"
  echo "Options:"
  echo "  -h, --help     Display this help message"
  # Add more options and descriptions as needed
  exit 0
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  show_help
fi
############################################################
# Main program                                             #
# Install the latest patch for last n minor Python versions.
py_versions=$(pyenv install --list | grep -v '[a-z]' | grep -Po '\d+\.\d+' | uniq | tail -$1)
for ver in $py_versions; do pyenv install $(pyenv install --list | grep $ver | grep -v '[a-z]' | tail -1); done
# Set the global Python as the most recent
latest_py=$(pyenv versions | grep -Po '\d+\.\d+\.\d+' | tail -1)
pyenv global $latest_py
