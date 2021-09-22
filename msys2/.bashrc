__SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CMDROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )

# Use the same "HOME" directory as Windows
HOME=$USERPROFILE

. $__SCRIPTDIR/aliases.sh

. $__SCRIPTDIR/prompt.sh