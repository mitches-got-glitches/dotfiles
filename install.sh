# Download Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Installing gcc is recommended
brew update
brew install \
        gcc \
        stow \
        git \
        pyenv \
        yarn \
        pipx \
        keychain \
        bat \
        nushell \
        jandedobbeleer/oh-my-posh/oh-my-posh

# Install Python dependencies
brew install openssl readline sqlite3 xz zlib tcl-tk

# Clone and stow my config dotfiles.
git clone git@github.com:mitches-got-glitches/dotfiles.git
cd dotfiles
# Adopt allows stow if .bashrc already exists. We just restore
# back to what we had with Git.
stow --adopt bash
git restore .
stow vim
stow git
cd ..
source ~/.bashrc

# Install the latest patch for last 4 minor Python versions.
py_versions=$(pyenv install --list | grep -v '[a-z]' | grep -Po '\d+\.\d+' | uniq | tail -4)
for ver in $py_versions; do pyenv install $(pyenv install --list | grep $ver | grep -v '[a-z]' | tail -1); done
# Set the global Python as the most recent
latest_py=$(pyenv versions | grep -Po '\d+\.\d+\.\d+' | tail -1)
pyenv global $latest_py

# Install Python tools using pipx.
pipx ensurepath
pipx install black
pipx install typos
pipx install ipython
pipx install ruff
pipx install uvicorn
pipx install cookiecutter
pipx install pre-commit
pipx install mypy
pipx install poetry
pipx install mkdocs
pipx install jupyter
pipx install asciinema

# Generate SSH key for GitHub
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
echo 'Add this public SSH key to GitHub account'
