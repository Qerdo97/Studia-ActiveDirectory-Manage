$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

function Authors
{
Write-Host    "AZ1 Poprawa"
Write-Host    "Authors:"
Write-Host    "Grzegorz Sekuła"
Write-Host    "Robert Łobasiuk"
}

function Show-Menu
{
    param (
        [string]$Title = 'Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"

    Write-Host "1: Press '1' for this option."
    Write-Host "2: Press '2' for this option."
    Write-Host "3: Press '3' for this option."
    Write-Host "4: Press '4' for this option."
    Write-Host "5: Press '5' for this option."
    Write-Host "6: Press '6' for this option."
    Write-Host "7: Press '7' for this option."
    Write-Host "8: Press '8' for this option."
    Write-Host "A: Press 'A' for info about authors."
    Write-Host "Q: Press 'Q' to quit."
}

#Wyświetlenie menu i oczekiwanie na decyzję
do
{
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
        '1' {
            'You chose option #1'
        }
        '2' {
            'You chose option #2'
        }
        '3' {
            'You chose option #3'
        }
        '4' {
            'You chose option #4'
        }
        '5' {
            'You chose option #5'
        }
        '6' {
            'You chose option #6'
        }
        '7' {
            'You chose option #7'
        }
        '8' {
            'You chose option #8'
        }
        'a' {
            Authors
        }
    }
    pause
}
until ($selection -eq 'q')