#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#parse_git_branch() {
#  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}

#alias ls='ls --color=auto'
#PS1='[\u@\h \W$(parse_git_branch)]\$ '

# Autocomplete branch names
if
  [ -f ~/.git-completion.bash ];
then . ~/.git-completion.bash;
fi

# Theme toggle KDE
alias toggleTheme="sh ~/Documents/workspaces/studies/bash-scripts/scripts/toggleThemeKDE"

export WORK='/home/marcmatias/Documents/workspaces/work/'

# Powerline styles if not a tty terminal
RES=$(tty)
if [[ $RES == *"dev/pts/"* ]] ; then . ${HOME}/.powerline-marcmatias-theme.bash; fi

# Pyenv config, showing virutalenv name without warning
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
