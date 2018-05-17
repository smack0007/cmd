@ECHO OFF
PUSHD %~dp0

CALL alias.cmd

SET PATH=%PATH%;%~dp0\functions

IF EXIST %~dp0\cmdtk\cmdtk.exe (
    %~dp0\cmdtk\cmdtk.exe opacity 90
)

POPD

:: This has to be the last command otherwise execution will appear to stop
IF EXIST %~dp0\clink\clink.bat (
    %~dp0\clink\clink.bat inject
)