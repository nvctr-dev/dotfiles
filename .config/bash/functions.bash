#
# bash functions
#

# Pressing Enter ls current dir
__enter_or_ls(){
    if [[ -z "${READLINE_LINE//[[:space:]]/}" ]]; then
        READLINE_LINE='clear; tree --level=1'
        READLINE_POINT=${#READLINE_LINE}
    fi
}

bind -x '"\C-x\C-g":__enter_or_ls'
bind '"\C-j":accept-line'
bind '"\C-m":"\C-x\C-g\C-j"'

modernize_utilities(){
    modern_utils=(
        "eza" "ripgrep" "zoxide" "fd" "bat" "fzf" "git-delta" "dust" "duf" 
        "procs" "bottom" "sd" "atuin" "tealdeer" "xh" "direnv" "jq" "yq"
        "moor" "xdg-user-dirs"
    )
    modern_utilities_aur=(
        "walk"
    )
    sudo pacman -S --needed "${modern_utils[@]}" 
    yay -S --noconfirm "${modern_utilities_aur[@]}"
}

make_user_dirs(){
    xdg-user-dirs-update --help >/dev/null || {
        printf "bash: install xdg-user-dirs\n\t\"pacman -S xdg-user-dirs\"\n"
        return 1
    }

    base="${XDG_DATE_HOME:-$HOME/.local/share}/user-dirs"
    user_dirs=(
        "documents" 
        "downloads" 
        "media/music" 
        "media/images"
        "media/videos" 
        "templates" 
        "public" 
        "desktop"
    )
    for dir in "${user_dirs[@]}"; do
        mkdir -p "${base}/${dir}"
    done
    
    xdg-user-dirs-update --set HOME "$HOME"
    xdg-user-dirs-update --set DOCUMENTS "${base}/${user_dirs[0]}"
    xdg-user-dirs-update --set DOWNLOAD "${base}/${user_dirs[1]}"
    xdg-user-dirs-update --set MUSIC "${base}/${user_dirs[2]}"
    xdg-user-dirs-update --set PICTURES "${base}/${user_dirs[3]}"
    xdg-user-dirs-update --set VIDEOS "${base}/${user_dirs[4]}"
    xdg-user-dirs-update --set TEMPLATES "${base}/${user_dirs[5]}"
    xdg-user-dirs-update --set PUBLICSHARE "${base}/${user_dirs[6]}"
    xdg-user-dirs-update --set DESKTOP "${base}/${user_dirs[7]}"

    for name in DOCUMENTS   \
        DOWNLOAD            \
        MUSIC               \
        PICTURES            \
        VIDEOS              \
        TEMPLATES           \
        PUBLICSHARE         \
        DESKTOP             ;do
            printf "%-12s %s\n" "$name" "$(xdg-user-dir "$name")" 
    done
    
    ln -s "${base}" "${HOME}/files"
}

cleanup_orphans(){
    local -a orphans
    
    mapfile -t orphans < <(pacman -qdtq 2>/dev/null)

    if ((${#orphans[@]} == 0 )); then
        printf 'No orphaned packages found.\n'
        return 0
    fi 

    printf 'Orphaned packages:\n'
    printf '    %s\n' "${orphans[@]}"

    sudo pacman -Rns "${orphans[@]}"
}

fkill(){
    local selection
    local pid 

    selection="$(
        ps -eo pid=,comm=,args= |
            fzf --prompt='kill> '
    )" || return

    pid="${selection#"${selection%%[![:space:]]*}"}"
    pid="${pid%%[[:space:]]*}"

    [[ $pid =~ ^[0-9]+$ ]] || {
        print 'Invalid process selection.\n' >&2
        return 1
    }

    kill "$pid"
}   
