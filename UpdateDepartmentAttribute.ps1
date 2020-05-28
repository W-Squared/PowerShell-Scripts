$WorkObjects = Import-Csv -Path "CSV-Path"
foreach ($WorkObject in $WorkObjects)
{
 $user=$WorkObject.displayName
 $dep=$WorkObject.department
 Get-ADUser -Filter "DisplayName -like '$user'" -Server "DC" | Set-ADUser -Replace @{department="$dep"} 
 }