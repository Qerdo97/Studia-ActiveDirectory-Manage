#Ustawiamy nazwę pliku wynikowego
$fileName = "zablokowane konta"

#UX
Write-Host "Generowanie raportu - lista zablokowanych kont w domenie"
Write-Host ""

#Tworzymy nowy plik w Outputs
New-Item -Path $workDir\Outputs -Name "$fileName.txt" -Force

#Pobieramy informacje o wszystkich zablokowanych użytkownikach
$users = Get-ADUser -Filter {Enabled -eq 'false'} | Select-Object name | Sort-Object name

#W pętli odnosimy się do każdego obiektu zmiennej users i zostawiamy z niej tylko konkretną elementarną nazwę użytkowniak a następnie wpisujemy ją do pliku
foreach ($user in $users)
{
    $onlyUserName = $user.name
    Add-Content -Path "$workDir\Outputs\$onlyGroupName.txt" -Value $onlyUserName
}