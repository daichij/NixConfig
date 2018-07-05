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

# Temp
alias dock="xrandr --output DP-1-2 --right-of eDP-1 --auto && xrandr --output DP-1-3 --left-of eDP-1 --auto"
alias undock="xrandr --output DP-1-2 --off && xrandr --output DP-1-3 --off"
