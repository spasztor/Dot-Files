<#
.SYNOPSIS
  Powershell Profile
.DESCRIPTION
  Another Powershell profile that sets a bunch of stuff.
.NOTES
  Author  : Szabolcs Pasztor - szabolcs1992@gmail.com
.LINK
  https://github.com/spasztor/Dot-Files
#>

# First line of configuration:
write-host @'
-----------------------------------------------------------
Just another powershell profile that sets a bunch of stuff.
By: Szabolcs Pasztor, <szabolcs1992@gmail.com>
-----------------------------------------------------------
'@

# Aliases for vim.
Set-Alias vim "C:\Program Files (x86)\Vim\vim74\vim.exe"
Set-Alias gvim "C:\Program Files (x86)\Vim\vim74\gvim.exe"

# Configure environment variables:
switch ($env:ComputerName)
{
  "JJACO-01797" {
    write-host "Custom variables for $env:ComputerName loaded."
    $WORK="K:\common\Szabolcs_Pasztor\Programming"
    $DOTFILES = "$WORK\Github\Dot-files"
  }
  default {
    write-host @"
WARNING: $env:ComputerName is not registered. Please add $env:ComputerName to configuration.
"@
    $WORK = ""
  }
}
if ($WORK -eq "")
{
    $WORK = $HOME
    $DOTFILES = "$WORK\git\Dot-files"
}
$PSCONFIG_DIR = "$HOME\Documents\WindowsPowershell"
$MODULES = "$PSCONFIG_DIR\Modules"

# Script for longer history in shell:
$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

# if you don't already have this configured...
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# -------------------------------------------------------------------
# Powershell Plugins:
# ------------------------------------------------------------------

# Strange magical environment variables to get vim working properly.
# If vim not installed,
# Install vim.
# Else:
$env:vim = "C:\Program Files (x86)\Vim\vim74"
$env:gvim = "C:\Program Files (x86)\Vim\vim74"
write-host "Vim Environment Loaded."

# To get git loading properly, be sure to follow instructions here:
# http://learnaholic.me/2012/10/12/make-powershell-and-git-suck-less-on-windows/

# Configuration for PSGET:
# -----------------------------------------------
If (-not(Get-Module -ListAvailable -name psget))
{
  (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
  write-host "PsGet now installed. Loading Plugins:"
}
else {write-host "Module PsGet is already installed. Loading Plugins:"}

# For getting posh-git & ssh-agent to work:
# -----------------------------------------------
If (-not(Get-Module posh-git)) {install-module posh-git}
else {write-host "`t- posh-git found. Loading Settings..."}

$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"
. "$MODULES\posh-git\profile.example.ps1"

# Load Jump-Location profile
# -----------------------------------------------
If (-not(Get-Module jump.location)) {install-module jump.location}
else {write-host "`t- jump.location found. Loading Settings..."}

Import-Module "$MODULES\Jump.Location\Jump.Location.psd1"

# Last line of configuration:
write-host @'
-----------------------------------------------------------
Success! Profile has been loaded.
-----------------------------------------------------------
'@
# -------------------------------------------------------------------
# Profile editing functions:
# -------------------------------------------------------------------

# For updating Dot-Files
Function Update-DotFiles
{
    write-host "Updating Dot-Files..."
    python "$DOTFILES\update.py"
}

# For updating Dot-Files repo
Function Update-DotFilesRepo($message = "Automatic update from PS script.")
{
  pushd $DOTFILES
  if ((Read-Host "Update dot-files github repo? (y/n)") -eq "y") {
    git add -A
    if ((Read-Host "Use default message? (y/n)") -eq "n")
    {
      $message = read-host "Enter message for commit"
    }
    git commit -m $message
    git push
  }
  else
  {
    git status
  }
  popd
}

# For editing your PowerShell profile
Function Edit-Profile
{
    vim "$DOTFILES\powershell\Microsoft.PowerShell_profile.ps1"
    Update-DotFilesRepo("Automatic update of PS profile.")
    Update-Dotfiles
    write-host "Profile edit successful. Please reload profile."
}

# For editing your Vim settings
Function Edit-Vimrc
{
    vim "$DOTFILES\vim\.vimrc"
    Update-DotFilesRepo("Automatic update of .VIMRC.")
    Update-Dotfiles
}

# -------------------------------------------------------------------
# Other helper functions:
# -------------------------------------------------------------------

# For creating symbolic links
Function mklink
{
  runas /noprofile /user:Administrator cmd /c mklink $args
}

Function Restart-sshagent
{
  stop-sshagent
  start-sshagent
}
