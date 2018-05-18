DOSKEY alias=notepad "%~dp0\%0"
DOSKEY cd=cd /D $* ^&^& "%~dp0\functions\cmd-update-title.cmd"
DOSKEY ls=dir /B
DOSKEY pwd=echo %%cd%%
DOSKEY which=where $*
