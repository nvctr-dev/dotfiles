#
# bash aliases
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# 1s replacements
alias ls='eza -- group-directories-first -- icons=auto'
alias 1='eza -- group-directories-first -- icons=auto'
alias 11='eza -lah -- group-directories-first -- git -- icons=auto'
alias la='eza -a -- group-directories-first -- icons=auto'
alias tree='eza -- tree -- level=2 -- group-directories-first -- icons=auto'
alias lk='walk -- icons -- with-border -- fuzzy'

# human-readable file viewing
alias b='bat'
alias bn='bat -- style-numbers'
alias bp='bat -- plain'

# searching
alias rgi='rg -- ignore-case'
alias rgh='rg -- hidden'
alias fdh='fd -- hidden'

# disk and procs
alias disks='duf'
alias space='dust'
alias processes='procs'
alias monitor='btm'
alias ..= 'cd
alias ...= 'cd .. / .. '

# safety
# alias cp='cp -i'
# alias mv='mv -i'
# alias rm='rm -i'

# extra
alias update='sudo pacman -Syu'
alias vi='nvim'
alias v='nvim'
