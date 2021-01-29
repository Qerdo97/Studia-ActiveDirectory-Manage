$fileName = "zablokowane konta"

Write-Host "Generowanie raportu - lista zablokowanych kont w domenie"
Write-Host ""

New-Item -Path $workDir\Outputs -Name "$fileName.txt" -Force
$users = Search-ADAccount -LockedOut | Sort-Object name | Select-Object name
foreach ($user in $users)
{
    $onlyUserName = $user.name
    Add-Content -Path "$workDir\Outputs\$onlyGroupName.txt" -Value $onlyUserName
}