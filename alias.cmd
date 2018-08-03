DOSKEY alias=notepad "%~dp0\%0"
DOSKEY cd=cd /D $* ^&^& "%~dp0\functions\cmd-update-title.cmd"
DOSKEY clear=cls
DOSKEY cp=copy $*
DOSKEY e.=explorer .
DOSKEY gitex=gitextensions
DOSKEY git-log=git log --oneline --all --graph --decorate  $*
DOSKEY grep=findstr $*
DOSKEY ls=dir /B
DOSKEY pwd=echo %%cd%%
DOSKEY rimraf=rmdir /s /q $*
REM DOSKEY touch=copy NUL /y $*
DOSKEY which=where $*

