@ECHO OFF
DOSKEY alias=DOSKEY /macros
DOSKEY cat=type $*
DOSKEY cd=cd /D $* ^&^& "%~dp0\update.cmd"
DOSKEY clear=cls
DOSKEY cp=copy $*
DOSKEY e.=explorer .
DOSKEY git=git $* ^&^& "%~dp0\update.cmd"
DOSKEY grep=findstr $*
DOSKEY ls=dir /A $*
DOSKEY mcd=mkdir $* ^&^& cd $*
DOSKEY mv=move $*
DOSKEY pwd=echo %%cd%%
DOSKEY rimraf=rmdir /s /q $*
DOSKEY rm=del $*
DOSKEY which=where $*

