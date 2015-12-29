# Aliases for vim.
Set-Alias vim "C:\Program Files (x86)\Vim\vim74\vim.exe"
Set-Alias gvim "C:\Program Files (x86)\Vim\vim74\gvim.exe"

# Configure environment variables:
switch ($env:ComputerName)
{
  "JJACO-01797" {
    write-host "Profile for $env:ComputerName found."
    $WORK="K:\common\Szabolcs_Pasztor\Programming"
    $DOTFILES="$WORK\Github\Dot-files"
  }
  default {
  write-host "Profile for $env:ComputerName was not found. Please configure for specific settings."
  }
}
$PSCONFIG_DIR="$HOME\Documents\WindowsPowershell"
$MODULES="$PSCONFIG_DIR\Modules"

# -------------------------------------------------------------------
# Powershell Plugins:
# ------------------------------------------------------------------

# Strange magical environment variables to get vim working properly.
$env:vim = "C:\Program Files (x86)\Vim\vim74"
$env:gvim = "C:\Program Files (x86)\Vim\vim74"

# To get git loading properly, be sure to follow instructions here:
# http://learnaholic.me/2012/10/12/make-powershell-and-git-suck-less-on-windows/

# For getting posh-git & ssh-agent to work:
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"

# Load posh-git example profile:
. "$MODULES\posh-git\profile.example.ps1"

# Script for longer history in shell:
$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

# if you don't already have this configured...
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Load Jump-Location profile
Import-Module "$MODULES\Jump.Location\Jump.Location.psd1"

# -------------------------------------------------------------------
# Profile editing functions:
# -------------------------------------------------------------------

# For updating Dot-Files
Function Update-DotFiles
{
    write-host "Updating Powershell Dot-Files..."
    python "$DOTFILES\update.py"
}

# For updating Dot-Files repo
Function Update-DotFilesRepo($message = "Automatic update from PS script.")
{
  pushd $DOTFILES
  $repo_update = Read-Host "Update dot-files github repo? (y/n): "
  git status
  if ($repo_update -eq "y") {
    git add -A
    git commit -m $message
    git push
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
