__SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CMDROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )

. $__SCRIPTDIR/powerline.theme.sh

. $__SCRIPTDIR/aliases.sh

# . $__SCRIPTDIR/prompt.sh

source /mingw64/share/git/completion/git-completion.bash

unset __SCRIPTDIR