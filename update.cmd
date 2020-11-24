@ECHO OFF
TITLE %cd%

SET __GITBRANCH=
FOR /f %%I IN ('git branch --show-current 2^> NUL') DO SET __GITBRANCH=%%I

IF "%__GITBRANCH%" == "" (
    PROMPT %__PROMPT_PRE__%%__PROMPT_POST__%
) ELSE (
    PROMPT %__PROMPT_PRE__% $E[94m%__GITBRANCH%$E[90m%__PROMPT_POST__%
)