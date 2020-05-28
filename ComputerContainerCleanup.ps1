$daysInactive = 30
$time = (Get-Date).AddDays(-($daysInactive))

$inactiveComputers = Get-ADComputer -Server "DC" -SearchBase "LDAP Query" -Filter {LastLogonTimeStamp -lt $time}

foreach ($inactiveComputer in $inactiveComputers)
{
Move-ADObject -Server "DC" -Identity $inactiveComputer.DistinguishedName -TargetPath "LDAP OU"
}