# modules
#
# Invoke these commands on any new Powershell to install to include:
#   Install-Module -Name PSFzf -Scope CurrentUser -Force
#   Install-Module -Name Terminal-Icons -Repository PSGallery

Import-Module -Name Terminal-Icons 
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# aliases
Set-Alias cat bat
Set-Alias curl curl.exe

# Styling
$ENV:STARSHIP_CONFIG = "$pwd/starship.toml"
Invoke-Expression (&starship init powershell)
# Tools
Invoke-Expression (& { (zoxide init powershell | Out-String) })

