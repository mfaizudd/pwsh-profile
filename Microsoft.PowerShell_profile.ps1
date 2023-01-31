oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/zash.omp.json | Invoke-Expression
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-Alias lg lazygit
$hosts = "C:\Windows\System32\drivers\etc\hosts"
function Update-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") +
    ";" +
    [System.Environment]::GetEnvironmentVariable("Path","User")
}
$env:PYTHONIOENCODING="utf-8"
Invoke-Expression "$(thefuck --alias)"
Invoke-Expression (& {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6)
        { 
            'prompt' 
        } else
        { 
            'pwd' 
        }
    (zoxide init --hook $hook powershell | Out-String)
    })
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
