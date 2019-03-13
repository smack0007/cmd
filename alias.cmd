DOSKEY alias=npp "%~dp0\%0"
DOSKEY cd=cd /D $* ^&^& "%~dp0\scripts\cmd-update-title.cmd"
DOSKEY clear=cls
DOSKEY cp=copy $*
DOSKEY e.=explorer .
DOSKEY git-acp=git add -A ^&^& git commit -m $* ^&^& git push origin
DOSKEY git-log=git log --oneline --all --graph --decorate  $*
DOSKEY grep=findstr $*
DOSKEY ls=dir /B
DOSKEY mcd=mkdir $* ^&^& cd $*
DOSKEY pwd=echo %%cd%%
DOSKEY rimraf=rmdir /s /q $*
REM DOSKEY touch=copy NUL /y $*
DOSKEY which=where $*

