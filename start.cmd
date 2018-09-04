@ECHO OFF

IF NOT "%*" == "" (
    cmd /s /k "%~dp0init.cmd && %* "
) ELSE (
    cmd /k "%~dp0init.cmd"
)