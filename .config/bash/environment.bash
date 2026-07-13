#
# bash environment variables
#

# colored output
export CLICOLOR=1
export COLORTERM="truecolor"

# bash history
export HISTSIZE=50000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth: erasesdups
export HISTFILE="$HOME/.local/state/bash/history"

mkdir -p "$HOME/.local/state/bash"
if [[ -f "$HOME/.bash_history" ]]; then
mv "$HOME/.bash_history" "$HOME/.local/state/bash/history"

fi

# xdg defaults
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME: -$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME : -$HOME/ . cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME: -$HOME/. local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME: -$HOME/. local/state}"

export XDG_DATA_DIRS="${XDG_DATA_DIRS: -/usr/local/share: /usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS: -/etc/xdg} "

# user executables
export PATH="$HOME/.local/bin: $HOME/bin: $PATH"

# editor
export EDITOR="nvim"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
export SYSTEM_EDITOR="$EDITOR"
export GIT_EDITOR="$EDITOR"

# pager
export PAGER="moor"
export MANPAGER="$PAGER"
export GIT_PAGER="$PAGER"
export SYSTEMD_PAGER="$PAGER"
export BAT_PAGER="$PAGER"

# python
export PYTHON_HISTORY="$XDG_STATE_HOME/home/history"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"

# GNU readline
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# fzf
export FZF_DEFAULT_COMMAND="fd -- type f -- hidden -- exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -- type d -- hidden -- exclude .git"

# graphical applications
# export BROWSER="vivaldi"
# export TERMINAL="kitty"
