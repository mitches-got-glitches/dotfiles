# Make sure Git completions are sourced for the git aliases.
source /usr/share/bash-completion/completions/git

# Convenience aliases
alias cdproj="cd $HOME/projects"
alias act=". .venv/bin/activate"
alias pi='pip install'
alias pu='pip install -U'
alias pup='python -m pip install -U pip'
# Make ssh-agent run in background.
alias shup="nohup eval $(ssh-agent); ssh-add ~/.ssh/id_ed25519"

# Git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcaf='git commit --amend --no-edit'
alias gcs='SKIP=flake8,pydocstyle git commit'
alias gcsf='SKIP=flake8 git commit'
alias gcsdoc='SKIP=pydocstyle git commit'
alias gcsmsg='SKIP=prepare_commit_msg git commit'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
__git_complete gco _git_checkout
alias gcb='git checkout -b'
__git_complete gcb _git_checkout
alias gr='git restore'
alias grs='git restore --staged'
alias gp='git push'
alias gpu='git push -u origin HEAD'
alias gf='git fetch'
alias gpl='git pull'
alias grh='git reset HEAD'
alias gsl='git stash list'
alias gspu='git stash push -m'
alias install_hooks='pre-commit install; pre-commit install --hook-type prepare-commit-msg --hook-type commit-msg'
alias remove_hooks='pre-commit uninstall; pre-commit uninstall --hook-type prepare-commit-msg --hook-type commit-msg'
alias gsync='git fetch upstream;git rebase upstream/master'
