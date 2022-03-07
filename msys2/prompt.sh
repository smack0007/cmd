__BLACK="0"
__BLUE="33"
__GREEN="40"
__WHITE="255"
__YELLOW="226"

__DIVIDER_GLYPH=$'\ue0b0'
__FOLDER_GLYPH=$'\ue5fe'
__GIT_GLYPH=$'\ue725'

__PROMPT_COLOR=""

__prompt_color() {    
    if [[ $2 ]]; then
        __PROMPT_COLOR="\e[38;5;${1}m\e[48;5;${2}m";
    else
        __PROMPT_COLOR="\e[0m\e[38;5;${1}m"
    fi
}

__prompt () {
    # Update the tab title
    PS1="\[\e]2;$(pwd)\a\]"
    
    local git_branch=$(git branch --show-current 2>/dev/null)    
    
    __prompt_color $__WHITE $__BLUE
    PS1+="\n${__PROMPT_COLOR} ${__FOLDER_GLYPH} \w "
    
    if [[ $git_branch ]]; then       
        local git_status=$(git status -s)
        
        local git_color=$__GREEN
        if [[ $git_status ]]; then
            git_color=$__YELLOW
        fi
        
        __prompt_color $__BLUE $git_color
        PS1+="${__PROMPT_COLOR}${__DIVIDER_GLYPH}"
        
        __prompt_color $__BLACK $git_color
        PS1+="${__PROMPT_COLOR} ${__GIT_GLYPH} $git_branch "

        __prompt_color $git_color
        PS1+="${__PROMPT_COLOR}${__DIVIDER_GLYPH}"
    else
        __prompt_color $__BLUE
        PS1+="${__PROMPT_COLOR}${__DIVIDER_GLYPH}"
    fi
    
    __prompt_color $__WHITE
    PS1+="${__PROMPT_COLOR}\n#\e[0m "
}

PROMPT_COMMAND=__prompt
