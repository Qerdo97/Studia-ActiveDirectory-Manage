#Deklaracja  zmiennych 
Add-Type -AssemblyName System.Web
$firstname = Read-Host -Prompt 'Podaj imie'
$lastname = Read-Host -Prompt 'Podaj naziwsko'
$department = Read-Host -Prompt 'Podaj dział'
$domain = (Get-ADDomain).dnsroot
$header = "Login|Hasło"
$path="$workdir\inputs\nazwa użytkownika.txt"
$displayname = $firstname + ” ” + $lastname
$password = [System.Web.Security.Membership]::GeneratePassword(8, 2)
$securityPassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$inc = 0
$login = "${firstname}.${lastname}"
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
New-ADUser -Name $login -DisplayName $displayname -SamAccountName $login -UserPrincipalName "$mail" -GivenName "$firstname" -Surname "$lastname" -Department $department -AccountPassword $securityPassword -Enabled $true -Path "DC=$( $domain.Split(".")[0] ),DC=$( $domain.Split(".")[1] )" -ChangePasswordAtLogon $true -PasswordNeverExpires $false
New-Item $path |Add-Content -Value $header -Encoding Default
Add-Content -Value "$login|$password" -Path "$workdir/outputs/nazwa użytkownika.txt" -append -Encoding Default
