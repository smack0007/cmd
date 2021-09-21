CMDROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )

alias cmd-code="code $CMDROOT"
alias ll="ls -lA --color=auto"

__NORMAL="0"
__BOLD="1"
__FG="3"
__BG="4"

__BLACK="0"
__RED="1"
__GREEN="2"
__YELLOW="3"
__BLUE="4"
__PURPLE="5"
__CYAN="6"
__WHITE="7"

__DIVIDER_GLYPH=$'\ue0b0'
__FOLDER_GLYPH=$'\ue5fe'
__GIT_GLYPH=$'\ue725'

__prompt () {
    local git_branch=$(git branch --show-current 2>/dev/null)    
    
    PS1="\n\e[${__BG}${__BLUE};${__BOLD};${__FG}${__WHITE}m ${__FOLDER_GLYPH} \w "
    
    if [[ $git_branch ]]; then
        PS1+="\e[${__BG}${__GREEN};${__BOLD};${__FG}${__BLUE}m${__DIVIDER_GLYPH}"
        PS1+="\e[${__BG}${__GREEN};${__BOLD};${__FG}${__WHITE}m ${__GIT_GLYPH} $git_branch "
        PS1+="\e[0;${__NORMAL};${__FG}${__GREEN}m${__DIVIDER_GLYPH}"
    else 
        PS1+="\e[0;${__NORMAL};${__FG}${__BLUE}m${__DIVIDER_GLYPH}"
    fi
    
    PS1+="\e[0;${__NORMAL};${__FG}${__WHITE}m\n# "
}
PROMPT_COMMAND=__prompt

clear