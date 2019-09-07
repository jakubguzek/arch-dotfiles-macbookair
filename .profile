#!/bin/sh

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER='firefox'
export READER='zathura'
export PAGER='less'
export FILE="ranger"
export BIB="$HOME/Documents/latex/bib.bib"

echo $0 | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start i3 if not already running
[ "$(tty)" = "/dev/tty1" ] && !  pgrep -x i3 >/dev/null && exec startx
