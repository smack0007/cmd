@ECHO OFF

SETLOCAL ENABLEEXTENSIONS

SET SDK_PATH=C:\Program Files\dotnet\sdk\
SET SDK_VERSION=2.1.300

dotnet "%SDK_PATH%%SDK_VERSION%\Roslyn\bincore\csc.dll" "-reference:%SDK_PATH%/NuGetFallbackFolder/microsoft.netcore.app/2.0.0/ref/netcoreapp2.0/System.Runtime.dll" "-reference:%SDK_PATH%/NuGetFallbackFolder/microsoft.netcore.app/2.0.0/ref/netcoreapp2.0/System.Console.dll" %*

ENDLOCAL