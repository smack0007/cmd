@ECHO OFF
TITLE %cd%

SET __GITBRANCH=
FOR /f %%I IN ('git branch --show-current 2^> NUL') DO SET __GITBRANCH=%%I

SET __GITSTATUS=
IF NOT "%__GITBRANCH%" == "" (
    FOR /f %%I IN ('git status -s 2^> NUL') DO SET __GITSTATUS=%%I
)
IF NOT "%__GITSTATUS%" == "" (
    SET __GITSTATUS=*
)

REM $E[94m Blue foreground
REM $C (
REM $F )

IF "%__GITBRANCH%" == "" (
    PROMPT %__PROMPT_PRE__%%__PROMPT_POST__%
) ELSE (
    PROMPT %__PROMPT_PRE__% $E[94m$C%__GITBRANCH%%__GITSTATUS%$F%__PROMPT_POST__%
)