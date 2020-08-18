@ECHO OFF
SETLOCAL enableextensions 

REM Get the location of the the npm-prefix directory.
FOR /f "tokens=*" %%a in ( 'npm config get prefix' ) DO ( SET __NPM_PREFIX=%%a ) 
REM Remove trailing space from npm-prefix
SET __NPM_PREFIX=%__NPM_PREFIX:~0,-1%

REM Get all arguments except the first.
SET __SCRIPTARGS=
FOR /f "tokens=1,* delims= " %%a IN ("%*") DO ( SET __SCRIPTARGS=%%b )

tsc --strict --typeRoots "%__NPM_PREFIX%\node_modules\@types" --outFile %1.js %1 && node %1.js %__SCRIPTARGS%

ENDLOCAL