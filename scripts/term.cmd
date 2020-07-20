@ECHO OFF

IF "%1 " NEQ " " (
    START wt -d "%1 "
) ELSE (
    START wt
)