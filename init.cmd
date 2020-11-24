@ECHO OFF
PUSHD %~dp0

CALL init-core.cmd

POPD

CALL %~dp0\update.cmd