#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Get current git branch name
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /'
}

# Colors and format in Prompt String 1
PS1='${VIRTUAL_ENV:+\[\e[1;32m\](${VIRTUAL_ENV##*/}) }\[\e[1;34m\]\W\[\e[0m\]\[\e[1;33m\] $(git_branch)\[\e[1;30m\]\$\[\e[0m\] '

# Loaded pyenv into your shell properly
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Autocomplete branch names
if
  [ -f ~/.git-completion.bash ];
then . ~/.git-completion.bash;
fi

# Command ls returning text in colors
alias ls='ls --color=always'
