@ECHO OFF

REM Use the same "HOME" directory as Windows
SET HOME=%USERPROFILE%

CALL C:\msys64\msys2_shell.cmd -defterm -here -no-start -mingw64 -use-full-path