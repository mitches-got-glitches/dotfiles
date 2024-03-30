# Portable config files with Python development env setup

## Install

If starting in root, create a user:

```bash
apt-get update
apt-get install sudo -y
adduser --gecos "" mitch
usermod -aG sudo mitch
su - mitch
```

If `git` is needed:

```bash
sudo apt-get update
sudo apt-get install git -y
```

Then clone:

```bash
git clone https://github.com/mitches-got-glitches/dotfiles.git
cd dotfiles
```

If needed, add executable privileges to the file:

```bash
chmod +x ./install.sh
```

Then run the install script:

```bash
./install.sh
```

## Useful branches

None yet, but add more if you want to experiment with different configurations or more lightweight
installations.


## Troubleshooting

If having issues installing Python versions with pyenv wth Brew's gcc compiler, then install the
dependencies with `apt`:

```bash
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

And unlink the following:

```bash
brew unlink
```
