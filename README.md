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
