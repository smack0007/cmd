@ECHO OFF

PUSHD %~dp0\..

git add -A && git commit -m %1 && git push origin master

POPD