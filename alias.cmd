@ECHO OFF
DOSKEY alias=DOSKEY /macros
DOSKEY cat=type $*
DOSKEY cd=cd /D $* ^&^& "%~dp0\update.cmd"
DOSKEY clear=cls
DOSKEY cp=copy $* ^&^& "%~dp0\update.cmd"
DOSKEY copy=copy $* ^&^& "%~dp0\update.cmd"
DOSKEY del=del $* ^&^& "%~dp0\update.cmd"
DOSKEY e.=explorer .
DOSKEY git=git $* ^&^& "%~dp0\update.cmd"
DOSKEY grep=findstr $*
DOSKEY ls=dir /A $*
DOSKEY mcd=mkdir $* ^&^& cd $* ^&^& "%~dp0\update.cmd"
DOSKEY mv=move $* ^&^& "%~dp0\update.cmd"
DOSKEY pwd=echo %%cd%%
DOSKEY rimraf=rmdir /s /q $* ^&^& "%~dp0\update.cmd"
DOSKEY rm=del $* ^&^& "%~dp0\update.cmd"
DOSKEY which=where $*

