$fileName = "zmiana członkostwa grup"
$me = whoami

Write-Host "Dodawanie użytkowników do grup"
Write-Host ""
$group = Read-Host "Proszę podać nazwę docelowej grupy"
$user = Read-Host "Proszę podać login użytkownika na którym ma zostać wykonana operacja"
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