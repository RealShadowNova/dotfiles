$functionsDirectory = "$PSScriptRoot\functions";
$completionsDirectory = "$PSScriptRoot\completions";
$aliasesDirectory = "$PSScriptRoot\aliases";

Import-Module -Name posh-git
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

$PSReadLineOptions = @{
    PredictionSource = 'History'
    Colors           = @{ 
        'Command' = '#8181f7'
        'Comment' = 'DarkGray'
    }
}

Set-PSReadLineOption @PSReadLineOptions
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Load all custom functions
& "$functionsDirectory\Application-Functions.ps1"
& "$functionsDirectory\Git-Functions.ps1"
& "$functionsDirectory\GitHub-CLI-Functions.ps1"
& "$functionsDirectory\NodeJS-Functions.ps1"
& "$functionsDirectory\Terminal-Functions.ps1"

# Load all custom completions
& "$completionsDirectory\Custom-Completions.ps1"
& "$completionsDirectory\Git-Cliff-Completions.ps1"
& "$completionsDirectory\GitHub-CLI-Completions.ps1"
& "$completionsDirectory\Starship-Completions.ps1"
& "$completionsDirectory\Volta-Completions.ps1"

# Load all custom aliases
& "$aliasesDirectory\Custom-Aliases.ps1"

$Env:STARSHIP_CONFIG = "$PSScriptRoot\starship.toml"
Invoke-Expression (&starship init powershell)