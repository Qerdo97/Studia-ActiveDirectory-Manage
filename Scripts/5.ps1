$fileName = zmiana członkostwa grup
$me = whoami

Write-Host "Dodawanie użytkowników do grup"
Write-Host ""
$group = Read-Host "Proszę podać nazwę docelowej grupy:"
$user = Read-Host "Proszę podać login użytkownika na którym ma zostać wykonana operacja:"
Add-ADGroupMember -Identity $group -Members $user
New-Item -Path $workDir\Outputs -Name $fileName.txt -Force
Add-Content -Path "$workDir\Outputs\$fileName.txt" -Value "Użytkownik $me dodał użytkownika $user do grupy $group"