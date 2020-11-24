@ECHO OFF
PUSHD %~dp0

CALL alias.cmd
CALL env.cmd

SET BIN_DIR=%~dp0bin\
SET SCRIPTS_DIR=%~dp0scripts\
SET PATH=%~dp0bin;%~dp0scripts;%PATH%

REM $E[92m Green foreground
REM $P Current drive and path
REM $E[97m White foreground
REM [$T$H$H$H$H$H$H] Time with brackets
REM $_ Newline
REM $E[90m Gray foreground
REM # Number sign
REM $S Space
REM $E[37m Light gray foreground

SET __PROMPT_PRE__=$E[92m$P
SET __PROMPT_POST__= $E[97m[$T$H$H$H$H$H$H]$_$E[90m#$S$E[37m
PROMPT %__PROMPT_PRE__%%__PROMPT_POST__%

POPD

CLS
