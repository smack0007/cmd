DOSKEY alias=notepad "%~dp0\%0"
DOSKEY cd=cd /D $* ^&^& "%~dp0\functions\cmd-update-title.cmd"
DOSKEY clear=cls
DOSKEY e.=explorer .
DOSKEY gl=git log --oneline --all --graph --decorate  $*
DOSKEY grep=findstr $*
DOSKEY ls=dir /B
DOSKEY pwd=echo %%cd%%
DOSKEY which=where $*

