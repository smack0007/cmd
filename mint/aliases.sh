alias cmd-cd="cd $CMDROOT"
alias cmd-code="code $CMDROOT"
alias cmd-pull="pushd $CMDROOT > /dev/null && git pull && popd > /dev/null"

function cmd-push() {
    pushd $CMDROOT > /dev/null
    git add -A && git commit -m "$1" && git push origin master
    popd > /dev/null
}

alias cmd-status="pushd $CMDROOT > /dev/null && git status -s && popd > /dev/null"

function e() {
    xdg-open $1 2>/dev/null
}

alias ll="ls -lA --color=auto"

function mcd() {
    mkdir -p $1
    cd $1
}

function title() {
    echo -ne "\e]0;$1\a"
}