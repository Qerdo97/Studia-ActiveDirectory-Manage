#Generacja pustego plik
$path="$workdir\outputs\zablokowane konta data.txt"
$header ="Zablokowany użytkownik|data|Zablokowany przez użytkownika"
if (-not( Test-path $path)){
New-Item $path |Add-Content -Value $header -Encoding Default
}
function blockuser
{
    $domain = (Get-ADDomain).name
    $login= read-host "Podaj nazwe użytkownika do zablokowania"
    try {
    $login = Get-ADuser -Filter { SamAccountName -eq $login }
    Disable-ADAccount -identity $login.samAccountName
    Set-ADUser -identity $login -SmartcardLogonRequired $True
    $time = Get-Date
    $user= whoami
    $blockeduser=$login.SamAccountName
    Add-Content -value "$domain\$blockeduser|$time|$user" -path $path
    write-host "Użytkownik został zablokowany"
    }
    catch  {
        write-host "Nie poprawna nazwa użytkownika"

    }

}
blockuser 