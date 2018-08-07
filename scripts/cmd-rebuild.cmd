@ECHO OFF

PUSHD %~dp0\..

FOR /r %%i IN (src\*.cs) DO (
    dotnet build-file "%%i" -o bin
)

POPD