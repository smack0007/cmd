@ECHO OFF
TITLE %cd%

SET __GITBRANCH=
for /f %%I in ('git.exe rev-parse --abbrev-ref HEAD 2^> NUL') do set __GITBRANCH=%%I

if "%__GITBRANCH%" == "" (
    PROMPT %__PROMPT_PRE__%%__PROMPT_POST__%
) else (
    PROMPT %__PROMPT_PRE__% $E[94m%__GITBRANCH%$E[90m%__PROMPT_POST__%
)