@ECHO OFF

REM Get all arguments except the first.
SET __SCRIPTARGS=
FOR /f "tokens=1,* delims= " %%a IN ("%*") DO ( SET __SCRIPTARGS=%%b )

tsc --strict --typeRoots "%~dp0\..\tsc\@types" --outFile %1.js %1 && node %1.js %__SCRIPTARGS%