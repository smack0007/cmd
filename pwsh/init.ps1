$Profile = $MyInvocation.MyCommand.Path;
$ProfileRoot = $PSScriptRoot;
$CmdRoot = (Get-Item $ProfileRoot).Parent.FullName;

# Set the HOME environment variable for git
$env:HOME = $env:USERPROFILE;

$colors = @{
    "hostBackground" = $Host.UI.RawUI.BackgroundColor;
    "pathBackground" = [ConsoleColor]::Blue;
    "pathForeground" = [ConsoleColor]::White;
    "gitUnchangedBackground" = [ConsoleColor]::Green;
    "gitChangedBackground" = [ConsoleColor]::DarkYellow;
    "gitForeground" = [ConsoleColor]::Black;
};

$glyphs = @{
    "left_hard_divider" = [char]::ConvertFromUtf32(0xE0B0)
    "folder_open" = [char]::ConvertFromUtf32(0xE5FE)
    "git_branch" = [char]::ConvertFromUtf32(0xE725)
};

function __writePromptDivdier
{
    param([ConsoleColor] $fromColor, [ConsoleColor] $toColor)
    Write-Host $glyphs["left_hard_divider"] -ForegroundColor $fromColor -BackgroundColor $toColor -NoNewLine;
}

function __updateWindowTitle
{
    $title = "";

    if (Test-Administrator) {
        $title += "ADMIN: ";
    }

    $title += $pwd;
    $Host.UI.RawUI.WindowTitle = $title;
}

function global:prompt
{
    # If not the first line of output then add an extra
    # line to seperate commands.
    if ($Host.UI.RawUI.CursorPosition.Y -ne 0) {
        Write-Host "";
    }

    $path = $pwd.Path;

    if (!$path.EndsWith("\")) {
        $path = $path + "\";
    }

    Write-Host (" " + $glyphs["folder_open"] + " " + $path + " ") -BackgroundColor $colors["pathBackground"] -ForegroundColor $colors["pathForeground"] -NoNewLine;

    $gitBranch = git branch --show-current;
    if ($gitBranch) {
        $gitStatus = git status -s;
        if ($gitStatus) {
            $gitBackgroundColor = $colors["gitChangedBackground"];
        } else {
            $gitBackgroundColor = $colors["gitUnchangedBackground"];
        }
        
        __writePromptDivdier $colors["pathBackground"] $gitBackgroundColor;
        Write-Host (" " + $glyphs["git_branch"] + " " + $gitBranch + " ") -BackgroundColor $gitBackgroundColor -ForegroundColor $colors["gitForeground"] -NoNewLine;
        __writePromptDivdier $gitBackgroundColor $colors["hostBackground"];
    } else {
        __writePromptDivdier $colors["pathBackground"] $colors["hostBackground"];
    }
 
    Write-Host "";
    return "# ";
}

#
# Aliases
#

function cmd-cd { Set-Location $CmdRoot; }
function cmd-code { code $CmdRoot; }
function cmd-explorer { explorer $CmdRoot; }
function cmd-gitex { pushd $CmdRoot; gitex; popd; }
function cmd-pull { pushd $CmdRoot; git pull; popd; }
function cmd-push { param($message) pushd $CmdRoot; git add -A && git commit -m "$message" && git push origin master; popd; }
function cmd-status { pushd $CmdRoot; git status -s; popd; }

function env-get { param($key) $value = [System.Environment]::GetEnvironmentVariable($key); Write-Host $value; }
Set-Alias -Name get-env -Value env-get;

function env-list { Get-ChildItem Env:* | Sort-Object Name; }
Set-Alias -Name list-env -Value env-list;

function env-set { param($key, $value) [System.Environment]::SetEnvironmentVariable($key, $value); }
Set-Alias -Name set-env -Value env-set;

Remove-Alias -Name cd;
function cd { param($dir) Set-Location $dir; __updateWindowTitle }

function fork {
    & wt -w 0 -d "$(Get-Location)" "${env:PROGRAMFILES}\PowerShell\7\pwsh.exe" -noe -nop -nol -f "C:\cmd\pwsh\init.ps1" @args
}

function git-bash { & "${env:PROGRAMFILES}\Git\usr\bin\bash.exe" --login -i -l }

Set-Alias -Name e -Value explorer;
Set-Alias -Name grep -Value Select-String;
Set-Alias -Name ll -Value Get-ChildItem;

function mcd { param($dir) mkdir $dir && cd $dir; }
function mkdirp { param($dir) mkdir -p $dir; }

function rimraf { param($path) rm -r -force $path; }

# Credit: https://github.com/stephenn/powershell_sudo
function sudo() {
    if ($args.Length -eq 1) {
        start-process $args[0] -verb "runAs"
    }
    if ($args.Length -gt 1) {
        start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
    }
}

Remove-Item alias:\where -Force
function where { param($command) (Get-Command $command).Path; }

# 7z
if (Test-Path "C:\Program Files\7-Zip\7z.exe") {
    Set-Alias -Name 7z -Value "C:\Program Files\7-Zip\7z.exe";
}

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

function wslcode { param($dir) wsl.exe -- code $dir; }

#
# Functions
#

function Test-Administrator  
{  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}

__updateWindowTitle

function Git-Template
{
    param($src, $dest)
    git clone https://github.com/$src $dest --depth 1;
    cd $dest;
    rm -r -Force .git
}

# If any arguments are passed to the script
if ($args.Length -gt 0) {
    & @args
}