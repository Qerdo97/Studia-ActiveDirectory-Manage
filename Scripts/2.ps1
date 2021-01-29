#Generacja pustego plik
write-host "1. Generacja pustego pliku CSV z nagłówkami"
write-host "2. Tworzenie użytkowników z pliku CSV"
$path="$workdir\inputs\uzytkownicyblank.csv"
$header ="login|hasło|dział"
function generateCSV
{
if (-not( Test-path $path)){
New-Item $path |Add-Content -Value $header -Encoding Default
}
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
        $mail = $login + „@” + $domain
        New-ADUser -Name $login -DisplayName $displayname -SamAccountName $login -UserPrincipalName "$mail" -EmailAddress $mail -GivenName "$firstname" -Surname "$lastname" -Department $Department -AccountPassword $securityPassword -Enabled $true -Path "DC=$( $domain.Split(".")[0] ),DC=$( $domain.Split(".")[1] )" -ChangePasswordAtLogon $true -PasswordNeverExpires $false
        }
}
$choose = Read-Host "Proszę dokonać wyboru"
switch ($choose)
{
    '1' {
        generateCSV
    }
    '2' {
        importCSV
    }
}