#!/bin/bash
shopt -s autocd
HISTSIZE= HISTFILESIZE=
PS1='[\[\e[38;5;66m\]\u\[\e[38;5;239m\]@\[\e[38;5;167m\]\h \[\e[38;5;239m\]\W\[\e[0m\]]\$ '

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/nnn/quitcd.bash" ] && source "$HOME/.config/nnn/quitcd.bash"
