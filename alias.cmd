DOSKEY alias=notepad "%~dp0\%0"
DOSKEY cd=cd /D $* ^&^& "%~dp0\functions\cmd-update-title.cmd"
DOSKEY e.=explorer .
DOSKEY gl=git log --oneline --all --graph --decorate  $*
DOSKEY ls=dir /B
DOSKEY pwd=echo %%cd%%
DOSKEY which=where $*

