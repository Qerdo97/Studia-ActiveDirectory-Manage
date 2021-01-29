#Generacja pustego plik
$path = "$workdir\outputs\zmienione hasła.txt"
$header = "Zmieniono hasło dla użytkownika|Data|Zmieniono przez użytkownika"
if (-not( Test-path $path))
{
    New-Item $path |Add-Content -Value $header -Encoding Default
}
function changepassword
{
    $domain = (Get-ADDomain).name
    $login = read-host "Podaj nazwe użytkownika do zmiany hasła"
    $password = read-host "Podaj hasło"
    try
    {
        $login = Get-ADuser -Filter { SamAccountName -eq $login }
        Set-ADAccountPassword -identity $login -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)
        Set-ADUser -identity $login -SmartcardLogonRequired $True
        $time = Get-Date
        $user = whoami
        $blockeduser = $login.SamAccountName
        Add-Content -value "$domain\$blockeduser|$time|$user" -path $path
        write-host "Hasło zostało zmienione"
    }
    catch [Microsoft.ActiveDirectory.Management.ADPasswordComplexityException]
    {
        Write-Output $_.Exception
        write-host "Hasło jest zbyt słabe"

    }
    catch
    {
        write-host "Użytkownik nie istnieje"
    }


}
changepassword