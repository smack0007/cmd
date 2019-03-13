@ECHO OFF
PUSHD %~dp0

CALL ConEmu\ConEmu\CmdInit.cmd
CALL alias.cmd
CALL env.cmd

SET BIN_DIR=%~dp0bin\
SET SCRIPTS_DIR=%~dp0scripts\
SET PATH=%~dp0bin;%~dp0scripts;%PATH%

REM IF EXIST clink\clink.bat (
    REM CALL clink\clink.bat inject --quiet
REM )

REM SET prompt=$P$_$G$S

CLS

POPD

CALL %~dp0\scripts\cmd-update-title.cmd