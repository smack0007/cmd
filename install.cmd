reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%~dp0init.cmd" /f

:: Set the default size
reg add "HKCU\Console" /v WindowSize /t REG_DWORD /d 00190050 /f