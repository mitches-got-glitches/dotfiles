#!/bin/bash
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Install the latest patch for last n minor Python versions."
   echo
   echo "Syntax: install_python_versions.sh $1"
   echo "One positional arg for n versions"
}

############################################################
# Main program                                             #

Help
# Install the latest patch for last x minor Python versions.
py_versions=$(pyenv install --list | grep -v '[a-z]' | grep -Po '\d+\.\d+' | uniq | tail -$1)
for ver in $py_versions; do pyenv install $(pyenv install --list | grep $ver | grep -v '[a-z]' | tail -1); done
# Set the global Python as the most recent
latest_py=$(pyenv versions | grep -Po '\d+\.\d+\.\d+' | tail -1)
pyenv global $latest_py
