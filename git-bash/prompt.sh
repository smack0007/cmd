__ps1_directory() {
    printf "\n\e[97;104m $(pwd) ";
}

__ps1_git_branch() {
    local git_branch=$(git branch --show-current 2>/dev/null)

    if [[ $git_branch ]]; then
        local git_status=$(git status -s)
        
        if [[ $git_status ]]; then
            printf "\e[97;103m ${git_branch} "
        else
            printf "\e[97;42m ${git_branch} "
        fi

    fi
}

__ps1_end() {
    printf '\e[0m\n# '
}


PS1='$(__ps1_directory)$(__ps1_git_branch)$(__ps1_end)'
