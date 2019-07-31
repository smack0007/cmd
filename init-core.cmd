@ECHO OFF
PUSHD %~dp0

CALL alias.cmd
CALL env.cmd

SET BIN_DIR=%~dp0bin\
SET SCRIPTS_DIR=%~dp0scripts\
SET PATH=%~dp0bin;%~dp0scripts;%PATH%

SET PROMPT=$E[m$E[32m$E]$E\$E[92m$P$E[90m$_$E[90m$G$E[m$S$E]9;12$E\

POPD

CLS