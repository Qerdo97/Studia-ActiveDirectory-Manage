#Generacja pustego plik
Add-Type -AssemblyName System.Webu
write-host "1. Generacja pustego pliku CSV z nagłówkami"
write-host "2. Tworzenie użytkowników z pliku CSV"
$selection = Read-Host "Proszę dokonać wyboru:"
switch ($selection)
{
    'generateCSV' {
        Clear-Host
        '1. Generacja pustego pliku CSV z nagłówkami'
    }
    'importCSV' {
        Clear-Host
        '2. Tworzenie użytkowników z pliku CSV'
    }
}
function generateCSV
{
    Add-Content -Value "login|hasło|dział" -Path "$workdir/inputs/importusersblank.csv" -Encoding Default
}

function importCSV
{
    Write-host "Plik powinne się znajdować w input!"
    $file = read-host -Prompt "Podaj nazwe pliku"
    $users = Import-Csv $workdir/inputs/$file -Delimiter "|" -Encoding Default
    foreach ($user in $users)
    {
        $login = $user.login
        $SecurityPassword = ConvertTo-SecureString -String $user.Haslo -AsPlainText -Force
        $department = $user.dział
        $firstname, $lastname = $login.split(".")[0, -1]
        $domain = (Get-ADDomain).dnsroot
        $displayname = $firstname + ” ” + $lastname
        $mail = $login + „@” + $domain
        $inc = 0
        $sam = $login
        if (Get-ADuser -Filter { SamAccountName -eq $login })
        {
            do
            {
                $inc++
                $login = $sam + $inc
            }
            until(-not(Get-ADuser -Filter { SamAccountName -eq $login }))
        }
        New-ADUser -Name $login -DisplayName $displayname -SamAccountName $login -UserPrincipalName "$mail" -GivenName "$firstname" -Surname "$lastname" -Department $Departament -AccountPassword $securityPassword -Enabled $true -Path "DC=$( $domain.Split(".")[0] ),DC=$( $domain.Split(".")[1] )" -ChangePasswordAtLogon $true -PasswordNeverExpires $false

    }
}