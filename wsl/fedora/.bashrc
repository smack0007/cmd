__SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CMDROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." &> /dev/null && pwd )

# Update the tab title
PS1="\[\e]2;\w\a\]";
# Update the prompt
PS1+="\n\w\n# ";