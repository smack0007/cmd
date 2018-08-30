@ECHO OFF
PUSHD %~dp0

CALL alias.cmd
CALL env.cmd

SET BIN_DIR=%~dp0bin\
SET SCRIPTS_DIR=%~dp0scripts\
SET PATH=%~dp0bin;%~dp0scripts;%PATH%

IF EXIST clink\clink.bat (
    CALL clink\clink.bat inject --quiet
)

IF EXIST cmdtk\cmdtk.exe (
    cmdtk\cmdtk.exe opacity 90
)

SET prompt=$P$_$G$S

CLS

POPD

CALL %~dp0\scripts\cmd-update-title.cmd