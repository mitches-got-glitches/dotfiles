alias cdproj="cd $HOME/projects"


# # Load in Git completion
# if [ -f "~/.config/git/git-completion.bash" ]; then
  # source ~/.config/git/git-completion.bash
# else
  # echo "Error loading git completions"
# fi

SEND_256_COLORS_TO_REMOTE=1

# bash_prompt
# The various escape codes that we can use to color our prompt.
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
       CYAN="\[\033[0;36m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\033[0m\]"

   BOLD_RED="\e[1;31m"
      RESET="\e[0m"
 BOLD_GREEN="\e[1;32m"


# This determines the current branch name for a git repo when a git directory is navigated to
function git-current-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3,4

}

# This adds a variable to display the current branch name in the command prompt
function git-branch-prompt {
  local branch=`git-current-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}

# This adds a variable to display how many commits behind/ahead the current branch is in the command prompt
function git-commit-behind-ahead {
  commit_behind=''
  local current_branch=`git-current-branch-name`
  if [[ -n $current_branch ]]; then
    current_remote=$(git config branch.$current_branch.remote);
    current_merge_branch=$(git config branch.$current_branch.merge | cut -d / -f 3,4);

    if [[ -n $current_merge_branch ]]; then
      commit_behind=$(git rev-list --left-only --count $current_remote/$current_merge_branch...$current_branch);
      commit_ahead=$(git rev-list --right-only --count $current_remote/$current_merge_branch...$current_branch);
    fi

  fi

  if [ $commit_behind ]; then printf "[\001${BOLD_RED}\002%s\001${RESET}\002|\001${BOLD_GREEN}\002%s\001${RESET}\002]" $commit_behind $commit_ahead;  fi
}

 # Determine active Python virtualenv details.
 function set_virtualenv () {
   if test -z "$VIRTUAL_ENV" ; then
       PYTHON_VIRTUALENV=""
   else
       PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
   fi
 }

set_virtualenv

# This defines the prompt display in the terminal of the form:
# me: current_dir [current_branch][commits behind|commits ahead]:
PS1="${PYTHON_VIRTUALENV}${CYAN}\w${COLOR_NONE}${YELLOW}\$(git-branch-prompt)${COLOR_NONE}\$(git-commit-behind-ahead):"

# Bring colour to the ls command
alias ls='ls --color=auto'
LS_COLORS='di=0;31:fi=0:ex=0;32'
export LS_COLORS

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
alias tidygit="git checkout master && git branch --merged | egrep -v '(^\*|master)' | xargs git branch -d && git remote prune origin"

# Pass a number to pop the stash at that position.
gspo() {
  if [ $# -eq 0 ]; then
    git stash pop
  else
    git stash pop stash@{$1}
  fi
}
# Drop stash at position.
gsd() {
  git stash drop stash@{$1}
}
# Show stash at position.
gss() {
  git show stash@{$1}
}

grb() {
  remove_hooks
  git rebase -i HEAD~"$1"
  install_hooks
}

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

alias activate='source activate'

alias pi='pip install'
alias pu='pip install -U'
alias ci='conda install'
alias cu='conda update'
alias pup='python -m pip install -U pip'