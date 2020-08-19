@ECHO OFF
SETLOCAL enableextensions 

REM Get the location of the the npm-prefix directory.
FOR /f "tokens=*" %%a in ( 'npm config get prefix' ) DO ( SET __NPM_PREFIX=%%a ) 
REM Remove trailing space from npm-prefix
SET __NPM_PREFIX=%__NPM_PREFIX:~0,-1%

SET __SCRIPTFILE=%1
SET __OUTPUTFILE=%__SCRIPTFILE%

IF "%__OUTPUTFILE:~-3%" == ".ts" (
    SET __OUTPUTFILE=%__OUTPUTFILE:~0,-3%
) ELSE IF "%__OUTPUTFILE:~-4%" == ".tsx" (
    SET __OUTPUTFILE=%__OUTPUTFILE:~0,-4%
)

SET __OUTPUTFILE=%__OUTPUTFILE%.js

REM Get all arguments except the first.
SET __SCRIPTARGS=
FOR /f "tokens=1,* delims= " %%a IN ("%*") DO ( SET __SCRIPTARGS=%%b )

tsc --strict --typeRoots "%__NPM_PREFIX%\node_modules\@types" --outFile %__OUTPUTFILE% %__SCRIPTFILE% && node %__OUTPUTFILE% %__SCRIPTARGS%

ENDLOCAL