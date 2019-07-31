@ECHO OFF
CALL %~dp0init-core.cmd

IF NOT "%*" == "" (
	cmd %*
	EXIT
)