#Ustawiamy nazwę pliku wynikowego
$fileName = "zmiana członkostwa grup"

#W zmiennej me przechowujemy informację o nazwie naszego konta
$me = whoami

#UX oraz zebranie informacji do zmiennych
Write-Host "Dodawanie użytkowników do grup"
Write-Host ""
$group = Read-Host "Proszę podać nazwę docelowej grupy"
$user = Read-Host "Proszę podać login użytkownika na którym ma zostać wykonana operacja"

#Za pomocą try i catch badamy czy dany proces przejdzie pomyślnie, jeżeli tak wykonujemy skrypt, wpisujemy informację do pliku Outputs oraz informujemy użytkownika o pomyślnym wykonaniu zadania.
#W momencie kiedy napotkamy problem informujemy o tym w catch i wyświetlamy konkretny błąd.
try {
    Add-ADGroupMember -Identity $group -Members $user
    New-Item -Path $workDir\Outputs -Name $fileName.txt -Force
    Add-Content -Path "$workDir\Outputs\$fileName.txt" -Value "Użytkownik $me dodał użytkownika $user do grupy $group"
}
catch {
    Write-Host "Nie udało się wykonać operacji"
    Write-Host "Brak takiej grupy lub użytkownika"
    Write-Host "Wystąpił błąd: $Error"
}