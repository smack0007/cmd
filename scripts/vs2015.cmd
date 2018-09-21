@ECHO OFF

IF EXIST "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE" (
    START "" "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" %*
) ELSE (
    ECHO Visual Studio not found.
)