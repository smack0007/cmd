@ECHO OFF
PUSHD %~dp0

CALL alias.cmd
CALL env.cmd

SET BIN_DIR=%~dp0bin\
SET SCRIPTS_DIR=%~dp0scripts\
SET PATH=%~dp0bin;%~dp0scripts;%PATH%

SET __PROMPT_PRE__=$E[m$E[32m$E]$E\$E[92m$P$E[90m
SET __PROMPT_POST__=$_$E[90m#$E[m$S$E]9;12$E\
PROMPT %__PROMPT_PRE__%%__PROMPT_POST__%

POPD

CLS
