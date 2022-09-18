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

# Pyenv config, showing virutalenv name without warning
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export BASE_PROMPT=$PS1
function updatePrompt {
  if [[ "$(pyenv virtualenvs)" == *"* $(pyenv version-name) "* ]]; then
    export PS1='($(pyenv version-name)) '$BASE_PROMPT
  else
    export PS1=$BASE_PROMPT
  fi
}
export PROMPT_COMMAND='updatePrompt'

export WORK='/home/marcmatias/Documents/workspaces/work/'

RES=$(tty)
if [[ $RES == *"dev/pts/"* ]] ; then . ${HOME}/.powerline-marcmatias-theme.bash; fi
