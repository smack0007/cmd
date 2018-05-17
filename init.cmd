@ECHO OFF
PUSHD %~dp0

CALL alias.cmd

SET PATH=%PATH%;%~dp0\functions

POPD

IF EXIST %~dp0\clink\clink.bat (
    %~dp0\clink\clink.bat inject
)

@ECHO ON