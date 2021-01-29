#Generacja pustego plik
$path="$workdir\outputs\zablokowane konta data.txt"
$header ="Zablokowany użytkownik|data|Zablokowany przez użytkownika"
blockuser    
function blockuser
{
        $login = read-host "Podaj nazwe użytkownika do zablokowania"
        try {
           Get-ADuser -SamAccountName $login | out-null
           Disable-ADAccount -name $login
        }
        catch  {
            write-host = "Nie poprawna nazwa użytkownika"
        }
}