$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8BOM'
$PSDefaultParameterValues['*:Encoding'] = 'utf8BOM'
$workDir = $PSScriptRoot

function Authors
{
    Write-Host    "AZ1 Poprawa"
    Write-Host    ""
    Write-Host    "Authors:"
    Write-Host    "Grzegorz Sekuła"
    Write-Host    "Nr indeksu: 17313"
    Write-Host    ""
    Write-Host    "Robert Łobasiuk"
    Write-Host    "Nr indeksu: 17266"
}

function Show-Menu
{
    Clear-Host
    Write-Host "================ MENU ================"
    Write-Host ""
    Write-Host "    == Obsługa kont użytkowników ==   "
    Write-Host "1: Wciśnij '1' aby stworzyć konto użytkownika."
    Write-Host "2: Wciśnij '2' aby stworzyć wiele kont na podstawie pliku csv."
    Write-Host "3: Wciśnij '3' aby zablokować konto użytkownika."
    Write-Host "4: Wciśnij '4' aby zmienić hasło do konta użytkownika."
    Write-Host ""
    Write-Host "        == Obsługa kont grup ==       "
    Write-Host "5: Wciśnij '5' aby dodać użytkowników do grup."
    Write-Host ""
    Write-Host "             == Raporty ==            "
    Write-Host "6: Wciśnij '6' aby otrzymać listę grup z członkami."
    Write-Host "7: Wciśnij '7' aby otrzymać listę zablokowanych kont w domenie."
    Write-Host ""
    Write-Host "             == Więcej ==             "
    Write-Host "A: Wciśnij 'A' aby otrzymać informacje o autorach."
    Write-Host "Q: Wciśnij 'Q' aby wyjść."
    Write-Host ""
    Write-Host "======================================"
}

#Wyświetlenie menu i oczekiwanie na decyzję
do
{
    Show-Menu
    $selection = Read-Host "Proszę dokonać wyboru:"
    switch ($selection)
    {
        '1' {
            cls
            &"$workDir\Scripts\1.ps1" -workDir $workDir
        }
        '2' {
            cls
            'You chose option #2'
        }
        '3' {
            cls
            'You chose option #3'
        }
        '4' {
            cls
            'You chose option #4'
        }
        '5' {
            cls
            &"$workDir\Scripts\5.ps1" -workDir $workDir
        }
        '6' {
            cls
            'You chose option #6'
        }
        '7' {
            cls
            'You chose option #7'
        }
        '8' {
            cls
            'You chose option #8'
        }
        'a' {
            cls
            Authors
        }
    }
    pause
}
until ($selection -eq 'q')