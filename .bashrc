#
# ~/.bashrc
#

# Standard bashrc settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

alias ls='ls --color=auto'
alias sudo="sudo -v; sudo"
alias v="vifmrun ."
alias get_idf=". $HOME/esp/esp-idf/export.sh"
alias vifmimg="~/.config/vifm/vifmimg/vifmimg"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#copy file to clipboard
alias copy_file="xclip -selection clipboard -in"

###### custom color
# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white
######## end custom color


# Add git branch to PS1 prompt
##################### PS 1
parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' -e 's/^[ \t]*//' | awk '{print "[" $0 "]"}'
}

export PS1="\[\033[38;5;13m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] [ \[$(tput sgr0)\]\[\033[38;5;156m\]\u\[$(tput sgr0)\]: \[$(tput sgr0)\]\[\033[38;5;45m\]\W\[$(tput sgr0)\] ] \\$ \[$(tput sgr0)\]"

alias e="xdg-open"
alias html2text="python ~/scripts/html2text.py"
LYNX_CFG="~/.config/lynx/lynx.cfg"


unzip_d() {
    if [[ $# != 1 ]]; then echo I need a single argument, the name of the archive to extract; return 1; fi
    target="${1%.zip}"
    unzip "$1" -d "${target##*/}"
}

activate_env(){
    source $1/bin/activate
}

# Source binary - Get the path for a binary in your path 
realpath_bin(){
    if [[ $# != 1 ]]; then echo I need a single argument, the binary executable.; return 1; fi

    BIN_PATH=which $1
    LINK_PATH=$(readlink -f $(which $1))
    #if [[ $BIN_APTH == $LINK_PATH ]]; then echo "No link for the binary $1"; return 1; fi
}

alias boost="python -m flask_boost"

shopt -s cdable_vars # makes it possible to cd to VARS
export WORKDIR=$HOME/Documents/work
export COURSESDIR=$HOME/Documents/courses
export PROJECTDIR=$HOME/Documents/projects

export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/.config/vifm/vifmimg

# Check if vim exists and use it as git editor
if command nvim -v &> /dev/null; then
    export GIT_EDITOR=nvim 
elif command vim -v &> /dev/null; then
    export GIT_EDITOR=vim
fi



############ SHORTCUTS FOR Quality of Life

alias coursedir="cd $COURSESDIR"
alias workcd="cd $WORKDIR"
alias projectcd="cd $PROJECTDIR"

# some ls alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim=nvim

# tmux commands
alias tmf=$HOME/bin/tmux-fzf.sh
alias tma='tmux attach'

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Easy markdown to pdf conversion.
markdown2pdf_convert(){
    pandoc $1 -o $2
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Use ripgrep to ignore files for fzf
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
fi


# Add dotfiles config alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Load Angular CLI autocompletion.
source <(ng completion script)

# Set npm global path to home.
npm config set prefix ‘~/.npm-global’

export PATH=~/.npm-global/bin:$PATH

export NVM_DIR="$HOME/.nvm"
export CODE_MODE=0

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
