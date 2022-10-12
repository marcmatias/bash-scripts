## A simplified powerline prompt
#

#Colors
PS_Green='\[\e[32m\]'
PS_Red='\[\e[31m\]'
PS_Purple='\[\e[35m\]'
PS_Color_Off='\[\e[0m\]'
PS_Gray='\[\e[38;5;241m\]'
PS_Black='\[\e[0;30m\]'
PS_Blue='\[\e[0;34m\]'
PS_White='\[\e[0;37m\]'

_setup_ssh_prompt ()
{
  local char_cnt

  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    ps1_header="\u@\h"
  else
    ps1_header="\u"
  fi
}

_git_branch ()
{
  local git_status modified untracked ahead_behind gitbranch

  gitbranch=$(git branch 2> /dev/null | grep '\*' | sed -e 's/* \(.*\)/\1/')

  # We are in a Git folder
  if [ "$gitbranch" ] ; then
    # Get the branch
    git_branch_info="${gitbranch}"
  fi
}

_git_colors () {
  local On_Purple On_Green Black White Purple Green git_status

  # Background
  On_Purple='\001\e[45m\002'

  # Foreground
  White='\001\e[0;37m\002'
  Purple='\001\e[0;35m\002'
  Blue='\001\e[0;34m\002'

  # Reset
  Color_Off='\001\e[0m\002'

  _git_branch

  if [ "$git_branch_info" ] ; then
    git_prompt_info="${Blue}⇾ ${White} \
${Purple}${git_branch_info} ⇾ ${Color_Off}"
  else
    git_prompt_info="${Blue}⇾ ${Color_Off}"
  fi

  unset git_branch_info
}

_prompt ()
{
  _setup_ssh_prompt
  _git_colors

  # Get only folder name of path
  FOLDER_NAME=${PWD##*/}
  # Convert prompt home showing as ~
  if [ "$FOLDER_NAME" ]
  then
    PWD_HOME=" ${FOLDER_NAME/${HOME##*/}/\~} "
  else
    PWD_HOME=" / "
  fi

  PS1="${PS_Blue}${PWD_HOME}${git_prompt_info}${PS_Color_Off} "

  if [[ "$(pyenv virtualenvs)" == *"* $(pyenv version-name) "* ]]; then
    PS1="${PS_Green}$(pyenv version-name) ⇾ "$PS1
  fi

  unset folder_type_icon ps1_header git_prompt_info date_str

}

PROMPT_COMMAND=_prompt

export PS2="${PS_Green}>>${PS_Color_Off} "
export PS4="${PS_Purple}++${PS_Color_Off} "

