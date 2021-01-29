#UX
Write-Host "Generowanie raportu - lista grup z członkami"
Write-Host ""

#Zbieramy informację o wszystkich grupach w AD
$groups = Get-ADGroup -Filter * | Sort-Object name | Select-Object name

#Pierwsza pętla ma za zadanie z każdej pojedynczej wartości grupy wyłuskać elementarną jej nazwę oraz utworzyć dzięki niej plik w Outputs.
#Również w tym momencie pobieramy wszystkich użytkowników dla danej grupy
foreach ($group in $groups)
{
    $onlyGroupName = $group.name
    $users = Get-ADGroupMember $onlyGroupName | Sort-Object name | Select-Object name
    New-Item -Path $workDir\Outputs -Name "$onlyGroupName.txt" -Force

    #W drugiej pętli łuskamy elementarną nazwę użytkownika oraz dopisujemy ją do odpowiedniego pliku
    foreach ($user in $users)
    {
        $onlyParticipantName = $user.name
        Add-Content -Path "$workDir\Outputs\$onlyGroupName.txt" -Value $onlyParticipantName
    }
}