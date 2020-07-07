@ECHO OFF

IF "%1 " NEQ " " (
    PUSHD %1
)

START wt

IF "%1 " NEQ " " (
    POPD
)