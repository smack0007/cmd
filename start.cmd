@ECHO OFF

IF NOT "%*" == "" (
	cmd /k "%~dp0init.cmd && %*"
) ELSE (
	cmd /k %~dp0init.cmd
)