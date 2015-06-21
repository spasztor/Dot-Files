Set-Alias vi "C:\Program Files (x86)\Vim\vim74\vim.exe"
Set-Alias gvi "C:\Program Files (x86)\Vim\vim74\gvim.exe"

# for editing your PowerShell profile
Function Edit-Profile
{
    vi $profile
}

# for editing your Vim settings
Function Edit-Vimrc
{
    vi $home\_vimrc
}

Set-Variable WORK "K:\common\Szabolcs_Pasztor\Programming"
cd $WORK

$env:vim = "C:\Program Files (x86)\Vim\vim74"
$env:gvim = "C:\Program Files (x86)\Vim\vim74"
# Set up GitHub Environment
# (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
# $env:github_posh_git \profile.example.ps1
