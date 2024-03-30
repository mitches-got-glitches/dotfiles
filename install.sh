# Install brew dependencies
sudo apt-get update
sudo apt-get install build-essential procps curl file git -y

# Download Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Installing gcc is recommended
brew update
brew install \
        gcc \
        git \
        stow \
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
stow nu
cd ..
source ~/.bashrc

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
pipx inject mkdocs mkdocs-material[imaging]
pipx inject mkdocs mkdocstrings[python]
pipx inject mkdocs mkdocs-glightbox
pipx install jupyter
pipx install asciinema

# Generate SSH key for GitHub
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
echo 'Add this public SSH key to GitHub account'
