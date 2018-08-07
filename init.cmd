@ECHO OFF
PUSHD %~dp0

CALL alias.cmd
CALL env.cmd

SET BIN_DIR=%~dp0bin\
SET SCRIPTS_DIR=%~dp0scripts\
SET PATH=%PATH%;%~dp0bin;%~dp0scripts

IF EXIST clink\clink.bat (
    CALL clink\clink.bat inject --quiet
)

IF EXIST cmdtk\cmdtk.exe (
    cmdtk\cmdtk.exe opacity 90
)

SET prompt=$P$_$G$S
CALL scripts\cmd-update-title.cmd

CLS

POPD