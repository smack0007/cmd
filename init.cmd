@ECHO OFF
PUSHD %~dp0

CALL init-core.cmd

POPD

CALL %~dp0\scripts\cmd-update-title.cmd