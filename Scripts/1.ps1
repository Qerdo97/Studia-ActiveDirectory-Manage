Add-Type -AssemblyName System.Web
function Get-RandomCharacters($length, $characters)
{
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs = ""
    return [String]$characters[$random]
}
$firstname = Read-Host -Prompt 'Podaj imie'
$lastname = Read-Host -Prompt 'Podaj naziwsko'
$department = Read-Host -Prompt 'Podaj dział'
$domain = (Get-ADDomain).dnsroot
$header = "Login|Hasło"
$path = "$workdir/outputs/nazwa użytkownika.txt"
$displayname = $firstname + ” ” + $lastname
$password = Get-RandomCharacters -length 7 -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length 2 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length 3 -characters '1234567890'
$password += Get-RandomCharacters -length 2 -characters '!"§$%&/()=?}][{@#*+'

$securityPassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$inc = 0
$login = "${firstname}.${lastname}"
$sam = $login
if (-not( Test-path $path))
{
    New-Item $path |Add-Content -Value $header -Encoding Default
}
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
New-ADUser -Name $login -DisplayName $displayname -SamAccountName $login -UserPrincipalName "$mail" -EmailAddress $mail  -GivenName "$firstname" -Surname "$lastname" -Department $department -AccountPassword $securityPassword -Enabled $true -Path "DC=$( $domain.Split(".")[0] ),DC=$( $domain.Split(".")[1] )" -ChangePasswordAtLogon $true -PasswordNeverExpires $false
Add-Content -Value "$login|$password" -Path $path -Encoding Default
