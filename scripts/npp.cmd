@ECHO OFF

IF EXIST "C:\Program Files\Notepad++\notepad++.exe" (
    START "" "C:\Program Files\Notepad++\notepad++.exe" %*
) ELSE IF EXIST "C:\Program Files (x86)\Notepad++\notepad++.exe" (
    START "" "C:\Program Files (x86)\Notepad++\notepad++.exe" %*
) ELSE (
    ECHO Notepad++ not found.
)