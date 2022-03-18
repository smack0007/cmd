# Update the tab title
PS1="\[\e]2;🐋 $(pwd)\a\]";
# Update the prompt
PS1+="🐋 \w\n# ";

git config --global init.defaultBranch main;
git config --global include.path "/home/default/cmd/git/.gitconfig.aliases";