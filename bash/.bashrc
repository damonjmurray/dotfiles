#!bash
GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
COLOREND="\[\e[00m\]"


parse_git_branch() {
  if [[ -f "$BASH_COMPLETION_DIR/git-completion.bash" ]]; then
    branch=`__git_ps1 "%s"`
  else
    ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
    branch="${ref#refs/heads/}"
  fi

  if [[ `tput cols` -lt 110 ]]; then
    branch=`echo $branch | sed s/feature/f/1`
    branch=`echo $branch | sed s/hotfix/h/1`
    branch=`echo $branch | sed s/release/\r/1`

    branch=`echo $branch | sed s/master/mstr/1`
    branch=`echo $branch | sed s/develop/dev/1`
  fi

  if [[ $branch != "" ]]; then
    if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working directory clean" ]]; then
      echo "${GREEN}$branch${COLOREND} "
    else
      echo "${RED}$branch${COLOREND} "
    fi
  fi
}

# Prompt #
prompt() {
  if [ -d .git ]; then
    # is a git repository
    PS1="♆ \W $(parse_git_branch)\\$ "
  else
    PS1="\W \\$ "
  fi;
}

PROMPT_COMMAND=prompt


# Path #
#export PATH=/usr/local/bin:$PATH


# Tooling #
  # RVM #
  # load RVM into a shell session *as a function*
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  export PATH="$PATH:$HOME/.rvm/bin"

  # NVM #
  export NVM_DIR="/Users/damonjmurray/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
