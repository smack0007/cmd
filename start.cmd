@ECHO OFF

IF NOT "%*" == "" (
	START %~dp0ConEmu\ConEmu64.exe -NoUpdate -LoadCfgFile %~dp0ConEmu.xml -Here -run cmd /k "%~dp0init.cmd && %*"
) ELSE (
	START %~dp0ConEmu\ConEmu64.exe -NoUpdate -LoadCfgFile %~dp0ConEmu.xml -Here -run cmd /k %~dp0init.cmd
)