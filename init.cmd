@ECHO OFF
PUSHD %~dp0

CALL alias.cmd
CALL env.cmd

SET PATH=%PATH%;%~dp0functions
SET SCRIPTS_PATH=%~dp0scripts\

IF EXIST clink\clink.bat (
    CALL clink\clink.bat inject --quiet
)

IF EXIST cmdtk\cmdtk.exe (
    cmdtk\cmdtk.exe opacity 90
)

SET prompt=$P$_$G$S
CALL functions\cmd-update-title.cmd

CLS

POPD