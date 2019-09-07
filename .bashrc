#!/bin/bash

shopt -s autocd
HISTSIZE= HISTFILESIZE=
PS1='[\[\e[38;5;70m\]\u\[\e[38;5;239m\]@\[\e[38;5;58m\]\h \[\e[38;5;239m\]\W\[\e[0m\]]\$ '

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/nnn/quitcd.bash" ] && source "$HOME/.config/nnn/quitcd.bash"

awk '{ print $1"="$2 }' .Xresources | sed 19q | sed 's/\*.\([a-z]*[0-9]*\):/export \1/g' > $HOME/.cache/color.sh
