alias cmd-cd="cd $CMDROOT"
alias cmd-code="code $CMDROOT"
alias cmd-explorer="pushd $CMDROOT > /dev/null && explorer . && popd > /dev/null"
alias cmd-gitex="pushd $CMDROOT > /dev/null && gitex && popd > /dev/null"
alias cmd-pull="pushd $CMDROOT > /dev/null && git pull && popd > /dev/null"

function cmd-push() {
    pushd $CMDROOT > /dev/null
    git add -A && git commit -m "$1" && git push origin master
    popd > /dev/null
}

alias cmd-status="pushd $CMDROOT > /dev/null && git status -s && popd > /dev/null"

alias e="explorer"

alias fork="wt -w 0 -d '$(pwd)'"

alias gitex="/c/Program\ Files\ \(x86\)/GitExtensions/gitex.cmd"

alias ll="ls -lA --color=auto"

function mcd() {
    mkdir -p $1
    cd $1
}

function title() {
    echo -ne "\e]0;$1\a"
}