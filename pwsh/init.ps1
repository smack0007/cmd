$Profile = $MyInvocation.MyCommand.Path;
$ProfileRoot = $PSScriptRoot;
$CmdRoot = (Get-Item $ProfileRoot).Parent.FullName;

# Set the HOME environment variable for git
$Env:HOME = $Env:USERPROFILE;

$promptDivider = [char]::ConvertFromUtf32(0xE0B0);
$gitBranchSymbol = [char]::ConvertFromUtf32(0xE0A0);
$hostBackgroundColor = $Host.UI.RawUI.BackgroundColor;
$pathBackgroundColor = [ConsoleColor]::Blue;
$pathForegroundColor = [ConsoleColor]::White;
$gitUnchangedBackgroundColor = [ConsoleColor]::Green;
$gitChangedBackgroundColor = [ConsoleColor]::DarkYellow;
$gitForegroundColor = [ConsoleColor]::Black;

function global:prompt
{
    # If not the first line of output then add an extra
    # line to seperate commands.
    if ($Host.UI.RawUI.CursorPosition.Y -ne 0) {
        Write-Host "";
    }

    $promptString = "# ";

    Write-Host $promptDivider -BackgroundColor $pathBackgroundColor -ForegroundColor $hostBackgroundColor -NoNewLine;
    $path = $pwd.Path;
    Write-Host " $path " -BackgroundColor $pathBackgroundColor -ForegroundColor $pathForegroundColor -NoNewLine;

    $gitBranch = git branch --show-current;
    if ($gitBranch) {
        $gitStatus = git status -s;
        if ($gitStatus) {
            $gitBackgroundColor = $gitChangedBackgroundColor;
        } else {
            $gitBackgroundColor = $gitUnchangedBackgroundColor;
        }
        
        Write-Host $promptDivider -BackgroundColor $gitBackgroundColor -ForegroundColor $pathBackgroundColor -NoNewLine;
        Write-Host " $gitBranchSymbol $gitBranch " -BackgroundColor $gitBackgroundColor -ForegroundColor $gitForegroundColor -NoNewLine;
        Write-Host $promptDivider -BackgroundColor $hostBackgroundColor -ForegroundColor $gitBackgroundColor -NoNewLine;
    } else {
        Write-Host $promptDivider -BackgroundColor $hostBackgroundColor -ForegroundColor $pathBackgroundColor -NoNewLine;
    }

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss";
    $timestamp = "[$timestamp]";
    $cursorX = $Host.UI.RawUI.WindowSize.Width - $timestamp.Length;
    $cursorY = $Host.UI.RawUI.CursorPosition.Y;
    $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates $cursorX, $cursorY;
    Write-Host -Object $timestamp -ForegroundColor White;
 
    return $promptString;
}

$Host.UI.RawUI.WindowTitle = $pwd;

#
# Aliases
#

function cmd-cd() { Set-Location $CmdRoot; }
function cmd-code() { code $CmdRoot; }
function cmd-explorer() { explorer $CmdRoot; }
function cmd-gitex() { pushd $CmdRoot; gitex; popd; }
function cmd-pull() { pushd $CmdRoot; git pull; popd; }
function cmd-push() { param ($message) pushd $CmdRoot; git add -A && git commit -m "$message" && git push origin master; popd; }
function cmd-status() { pushd $CmdRoot; git status -s; popd; }

function env-get() { param($key) $value = [System.Environment]::GetEnvironmentVariable($key); Write-Host $value; }
function env-list() { Get-ChildItem Env:* | Sort-Object Name; }
function env-set() { param($key, $value) [System.Environment]::SetEnvironmentVariable($key, $value); }

Remove-Alias -Name cd;
function cd() { param($dir) Set-Location $dir; $Host.UI.RawUI.WindowTitle = $pwd; }

Set-Alias -Name e -Value explorer
Set-Alias -Name ll -Value Get-ChildItem

function mcd() { param ($dir) mkdir $dir && cd $dir; }

function rimraf() { param ($path) rm -r -force $path; }

# npp
if (Test-Path "C:\Program Files\Notepad++\notepad++.exe") {
    Set-Alias -Name npp -Value "C:\Program Files\Notepad++\notepad++.exe";
} elseif (Test-Path "C:\Program Files (x86)\Notepad++\notepad++.exe") {
    Set-Alias -Name npp -Value "C:\Program Files (x86)\Notepad++\notepad++.exe";
}

# vs
if (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe") {
    Set-Alias -Name vs -Value "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe";
} elseif (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe") {
    Set-Alias -Name vs -Value "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe";
}
