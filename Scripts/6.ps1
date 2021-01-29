Write-Host "Generowanie raportu - lista grup z członkami"
Write-Host ""
$groups = Get-ADGroup -Filter * | Sort-Object name | Select-Object name

foreach ($group in $groups)
{
    $onlyGroupName = $group.name
    $users = Get-ADGroupMember $onlyGroupName | Sort-Object name | Select-Object name
    New-Item -Path $workDir\Outputs -Name "$onlyGroupName.txt" -Force
    foreach ($user in $users)
    {
        $onlyParticipantName = $user.name
        Add-Content -Path "$workDir\Outputs\$onlyGroupName.txt" -Value $onlyParticipantName
    }
}