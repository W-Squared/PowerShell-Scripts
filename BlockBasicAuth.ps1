$Users = Import-CSV -Path "CSV-Path"

foreach ($User in $Users)
{
$UPN = $User.'UPN'
Set-User -Identity "$UPN" -AuthenticationPolicy "Block Basic Auth"
}