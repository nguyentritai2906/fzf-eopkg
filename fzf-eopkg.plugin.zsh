#!/usr/bin/env zsh

FE_PREVIEW="echo {} | cut -d' ' -f1 | xargs -I{} eopkg info {} | bat"
FE_TIEBREAK="length,begin,end,index"
FE_CACHE=true
FE_CACHE_PATH=$HOME/.config/repo-la.txt
FE_CACHE_INTERVAL=$(( 60 * 60 * 24 * 15 ))

if ! command -v fzf >/dev/null; then
    echo 'fzf command not found: please install via "sudo eopkg install fzf"'
fi

# Search for packages in the repositories and install
fzf_eopkg_install() {
    if $FE_CACHE; then
        local inst=$(cat $FE_CACHE_PATH | fzf --query="$1" -m --tiebreak $FE_TIEBREAK --ansi --preview $FE_PREVIEW --preview-window=nohidden)
    else
        local inst=$(eopkg la | sed -e '1,3d' | awk '{print $1}' | fzf --query="$1" -m --tiebreak $FE_TIEBREAK --ansi --preview $FE_PREVIEW --preview-window=nohidden)
    fi
    test -n "$inst" && print -z -- "sudo eopkg it $(echo $inst | cut -d' ' -f1 | tr '\n' ' ')"
}

# Search for installed packages and remove
fzf_eopkg_remove() {
    local inst=$(eopkg li | awk '{print $1}' | fzf --query="$1" -m --tiebreak $FE_TIEBREAK --ansi --preview $FE_PREVIEW --preview-window=nohidden)
    test -n "$inst" && print -z -- "sudo eopkg rm $(echo $inst | cut -d' ' -f1 | tr '\n' ' ')"
}

# Search for installed packages
fzf_eopkg_list_installed() {
    local inst=$(eopkg li | awk '{print $1}' | fzf --ansi --tiebreak $FE_TIEBREAK --preview $FE_PREVIEW --preview-window=nohidden)
    print -z -- "$(echo $inst | awk '{print $1}')"
}

# Cache all available packages in the repositories for faster 'pit' search
fzf_eopkg_cache_available() {
    echo "Caching available packages in Solus repository";
    eopkg la | sed -e '1,3d' | awk '{print $1}'> $FE_CACHE_PATH;
    echo "Done!";
}

if $FE_CACHE; then
    if [ -f "$FE_CACHE_PATH" ]; then
        if [ $(expr $(date +%s) - $(date +%s -r $FE_CACHE_PATH)) -gt $FE_CACHE_INTERVAL ]; then
            echo "[Cache available packages] Would you like to update? [Y/n]: \c"
            read line
            if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
                fzf_eopkg_cache_available;
            else
                echo "As you wish!";
            fi
        fi
    else
        fzf_eopkg_cache_available;
    fi
fi

function __setup_fzf_eopkg() {
    alias pit=fzf_eopkg_install
    alias prm=fzf_eopkg_remove
    alias pca=fzf_eopkg_cache_available
    alias pli=fzf_eopkg_list_installed
}

__setup_fzf_eopkg
