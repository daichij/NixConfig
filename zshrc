#!/bin/zsh

export TERMINAL=xfce4-terminal

autoload -U compinit
compinit

setopt correctall

autoload -U promptinit
promptinit

export PS1="%B[%n@%M %~]>%b "

export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space

alias ll="ls -al"
alias llc="clear && ls -al"
alias brightnessto="sudo tee /sys/class/backlight/intel_backlight/brightness <<< "
alias kblightto="sudo tee /sys/class/leds/asus::kbd_backlight/brightness <<< "

# Up arrow search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval `ssh-agent`
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-agent

# Temp
alias dock="xrandr --output DP-1-2 --right-of eDP-1 --auto && xrandr --output DP-1-3 --left-of eDP-1 --auto"
alias undock="xrandr --output DP-1-2 --off && xrandr --output DP-1-3 --off"
alias logPull="/home/pcadm1n/getLog.sh"
alias logconvert="/home/pcadm1n/workspace/CommonEmbedded/Eric/Main/build.tools/Common/Tools/logconvert/bin/tools/logconvert"
alias dlogparser="/home/pcadm1n/workspace/CommonEmbedded/Eric/Main/build.tools/Common/Tools/DlogParser/bin/tools/dlogparser"
alias fixMyStuff="xrandr --output eDP-1 --mode 1920x1080 && dock && feh --bg-fill ~/NixConfig/powerlines.png"
alias displaylink="sudo systemctl start displaylink.service"
