# locke1 12/3/17
# .bashrc

# this file contains user-specific aliases and functions

# ———— ———— ———— ———— ———— ———— ————
# ALIASES
# ———— ———— ———— ———— ———— ———— ————

alias python='python3'

# l gives ls in long format:
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lF'
alias g='git status'
alias b='git branch'

# open current directory in Finder:
alias f='open -a Finder ./ '

# display all directories beginning with a dot:
alias l.='ls -d .* --color=auto'

## DOCKER SETUP
source /etc/bash_completion.d/docker-machine-prompt.bash
source /etc/bash_completion.d/docker-machine.bash
alias dm='docker-machine'
eval $(dm env)

# command history will not record the same command twice in a row:
export HISTCONTROL=ignoredups

## GIT SETUP
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

# command history will record up to 1000 commands rather than default 500:
export HISTSIZE=A1000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'
if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;34m\]\[\033[00m\]\$ '
    PS1='\033[0;36m\u@\h:\W\[$(__docker_machine_ps1)\]$(__git_ps1 " (%s)" 2>/dev/null)\033[0m $ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

