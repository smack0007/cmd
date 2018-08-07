@ECHO OFF

IF EXIST D:\CODE (
    D:
    CD \CODE
) ELSE IF EXIST E:\CODE (
    E:
    CD \CODE
)

CALL %~dp0cmd-update-title.cmd
