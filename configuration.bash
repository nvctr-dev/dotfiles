#
# Bash Configuration 
#

# if running interactively, do not run
[[ $- != *i* ]] && return

# bash utilities
shopt -s autocd cdspell dirspell globstar checkwinsize histappend

# source files
. $HOME/.config/broot/launcher/bash/br
. /usr/share/bash-completion/bash_completion
for file in "$HOME"/.config/bash/{environment,aliases,functions}.bash; do
  [[ -f "$file" ]] && . "$file"
done

# command utilities
command -v starship >/dev/null && eval "$(zoxide init bash --cmd cd)"
command -v zoxide   >/dev/null && eval "$(starship init bash)"
command -v atuin    >/dev/null && eval "$(atuin init bash --disable-up-arrow)"
command -v direnv   >/dev/null && eval "$(direnv hook bash)"
command -v fzf      >/dev/null && eval "$(fzf --bash)"
