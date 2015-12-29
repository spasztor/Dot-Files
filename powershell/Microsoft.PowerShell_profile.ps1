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
write-host "`nLoading profile..."

# Aliases for vim.
Set-Alias vim "C:\Program Files (x86)\Vim\vim74\vim.exe"
Set-Alias gvim "C:\Program Files (x86)\Vim\vim74\gvim.exe"

# Configure environment variables:
switch ($env:ComputerName)
{
  "JJACO-01797" {
    write-host "Custom variables for $env:ComputerName found."
    $WORK="K:\common\Szabolcs_Pasztor\Programming"
    $DOTFILES="$WORK\Github\Dot-files"
  }
  default {
    write-host "Custom variables for $env:ComputerName was not found. Please configure."
    exit 1
  }
}
$PSCONFIG_DIR="$HOME\Documents\WindowsPowershell"
$MODULES="$PSCONFIG_DIR\Modules"

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
$env:vim = "C:\Program Files (x86)\Vim\vim74"
$env:gvim = "C:\Program Files (x86)\Vim\vim74"
write-host "Set Vim Environment Variables."

# To get git loading properly, be sure to follow instructions here:
# http://learnaholic.me/2012/10/12/make-powershell-and-git-suck-less-on-windows/

# For getting posh-git & ssh-agent to work:
# If module not installed
# Then install module
# After installation:
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"

# Load posh-git example profile:
. "$MODULES\posh-git\profile.example.ps1"
write-host "posh-git loaded"

# Load Jump-Location profile
# If module not installed
# Then install module
# After installation:
Import-Module "$MODULES\Jump.Location\Jump.Location.psd1"
write-host "Jump.Location loaded"

# Last line of configuration:
write-host "`nProfile loaded."
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
