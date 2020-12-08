$Profile = $MyInvocation.MyCommand.Path
$ProfileRoot = $PSScriptRoot
$CmdRoot = (Get-Item $ProfileRoot).Parent.FullName

function global:prompt
{
    $path = $pwd.Path
    Write-Host -Object "$path " -ForegroundColor Green -NoNewLine

    $timestamp = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
    $timestamp = "[$timestamp]"
    $cursorX = $Host.UI.RawUI.WindowSize.Width - $timestamp.Length
    $cursorY = $Host.UI.RawUI.CursorPosition.Y
    $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates $cursorX,$cursorY
    Write-Host -Object $timestamp -ForegroundColor White
 
    return "# "
}

#
# Aliases
#

function cmd-cd() { Set-Location $CmdRoot }
function cmd-code() { code $CmdRoot }
function cmd-explorer() { explorer $CmdRoot }
function cmd-gitex() { pushd $CmdRoot; gitex; popd; }
function cmd-pull() { pushd $CmdRoot; git pull; popd }
function cmd-push() { param ($message) pushd $CmdRoot; git add -A && git commit -m "$message" && git push origin master; popd }
function cmd-status() { pushd $CmdRoot; git status -s; popd }

function mcd() { param ($dir) mkdir $dir && cd $dir }


# npp
if (Test-Path "C:\Program Files\Notepad++\notepad++.exe") {
    Set-Alias -Name npp -Value "C:\Program Files\Notepad++\notepad++.exe"
} elseif (Test-Path "C:\Program Files (x86)\Notepad++\notepad++.exe") {
    Set-Alias -Name npp -Value "C:\Program Files (x86)\Notepad++\notepad++.exe"
}

# vs
if (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe") {
    Set-Alias -Name vs -Value "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe"
} elseif (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe") {
    Set-Alias -Name vs -Value "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe"
}
