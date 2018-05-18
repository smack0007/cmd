@ECHO OFF
PUSHD %~dp0

CALL alias.cmd

SET PATH=%PATH%;%~dp0\functions

IF EXIST clink\clink.bat (
    CALL clink\clink.bat inject
)

IF EXIST cmdtk\cmdtk.exe (
    cmdtk\cmdtk.exe opacity 90
)

CALL functions\cmd-update-title.cmd

POPD