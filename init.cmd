@ECHO OFF
PUSHD %~dp0

CALL alias.cmd

SET PATH=%PATH%;%~dp0\functions

IF EXIST clink\clink.bat (
    CALL clink\clink.bat inject --quiet
)

IF EXIST cmdtk\cmdtk.exe (
    cmdtk\cmdtk.exe opacity 90
)

SET prompt=$P$_$G$S
CALL functions\cmd-update-title.cmd

MODE 120,40
CLS

POPD