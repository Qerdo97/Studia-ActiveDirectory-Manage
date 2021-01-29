#Generacja pustego plik
$path="$workdir\outputs\zablokowane konta data.txt"
$header ="Zablokowany użytkownik|Data|Zablokowany przez użytkownika"
if (-not( Test-path $path)){
New-Item $path |Add-Content -Value $header -Encoding Default
}
function blockuser
{
    $domain = (Get-ADDomain).name
    $login= read-host "Podaj login użytkownika do zablokowania"
    try {
    $sam = Get-ADuser -Filter { SamAccountName -eq $login }
    Disable-ADAccount -identity $sam.samAccountName
    Set-ADUser -identity $login -SmartcardLogonRequired $True
    $time = Get-Date
    $user= whoami
    $blockeduser=$sam.SamAccountName
    Add-Content -value "$domain\$blockeduser|$time|$user" -path $path
    write-host "Użytkownik został zablokowany"
    }
    catch  {
        write-host "Nie poprawna nazwa użytkownika"

    }

}
blockuser 