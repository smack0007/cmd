@ECHO OFF

IF "%1 " NEQ " " (
    wt -d "%1 "
) ELSE (
    wt
)