@ECHO OFF

REM Use the same "HOME" directory as Windows
SET HOME=%USERPROFILE%

SET __MSYS_CMD=C:\msys64\msys2_shell.cmd
SET __MSYS_ARGS=-defterm -here -no-start -mingw64 -use-full-path

CALL %__MSYS_CMD% %__MSYS_ARGS%