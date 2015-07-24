# Aliases for vim.
Set-Alias vi "C:\Program Files (x86)\Vim\vim74\vim.exe"
Set-Alias gvi "C:\Program Files (x86)\Vim\vim74\gvim.exe"

# For editing your PowerShell profile
Function Edit-Profile
{
    vi $profile
}

# For editing your Vim settings
Set-Variable VIMRC $home\_Vimrc
Function Edit-Vimrc
{
    vi $home\_vimrc
}

# Quick Alias for working folder.
Set-Variable WORK "K:\common\Szabolcs_Pasztor\Programming"
cd $WORK

# Strange magical environment variables to get vim working properly.
$env:vim = "C:\Program Files (x86)\Vim\vim74"
$env:gvim = "C:\Program Files (x86)\Vim\vim74"

# Ti get git loading properly, be sure to follow instructions here:
# http://learnaholic.me/2012/10/12/make-powershell-and-git-suck-less-on-windows/
#
# Load posh-git example profile
. 'K:\common\Szabolcs_Pasztor\Utilities\Developing\_cloned\posh-git\profile.example.ps1'

# Script for longer history in shell:
$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

# if you don't already have this configured...
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward


