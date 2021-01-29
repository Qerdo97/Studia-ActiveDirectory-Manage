#Generacja pustego plik
write-host "1. Generacja pustego pliku CSV z nagłówkami"
write-host "2. Tworzenie użytkowników z pliku CSV"
$path="$workdir\inputs\uzytkownicy.csv"
$header ="login|hasło|dział"
$selection = Read-Host "Proszę dokonać wyboru:"
switch ($selection)
{
    '1' {
        Clear-Host
        generateCSV
    }
    '2' {
        Clear-Host
        '2. Tworzenie użytkowników z pliku CSV'
        importCSV
    }
}
function generateCSV
{
remove-item $path -force
New-Item $path |Add-Content -Value $header -Encoding Default -force
}

function importCSV
{
    $users = Import-Csv $workdir/inputs/uzytkownicy.csv -Delimiter "|" -Encoding Default
    foreach ($user in $users)
    {
        $login = $user.login
        $password = $user.haslo
        $SecurityPassword = ConvertTo-SecureString -String $password -AsPlainText -Force
        $department = $user.dzial
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
        New-ADUser -Name $login -DisplayName $displayname -SamAccountName $login -UserPrincipalName "$mail" -GivenName "$firstname" -Surname "$lastname" -Department $Department -AccountPassword $securityPassword -Enabled $true -Path "DC=$( $domain.Split(".")[0] ),DC=$( $domain.Split(".")[1] )" -ChangePasswordAtLogon $true -PasswordNeverExpires $false
        Write-host "użytkownicy zostali dodani"
    }
}