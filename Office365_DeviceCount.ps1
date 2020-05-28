$csv = "CSV-PATH"
$activeMailboxUsers = Get-Content "CSV-PATH" 
$results =@()
$mobileDevice = @()

foreach($user in $activeMailboxUsers)
{
    $mobileDevices = Get-MobileDevice -Mailbox $user

        foreach($mobileDevice in $mobileDevices)
        {
            $properties = @{
                Name = $user.name
                UPN = $UPN
                DisplayName = $displayName
                FriendlyName = $mobileDevice.FriendlyName
                ClientType = $mobileDevice.ClientType
                ClientVersion = $mobileDevice.ClientVersion
                DeviceId = $mobileDevice.DeviceId
                DeviceMobileOperator = $mobileDevice.DeviceMobileOperator
                DeviceModel = $mobileDevice.DeviceModel
                DeviceOS = $mobileDevice.DeviceOS
                DeviceTelephoneNumber = $mobileDevice.DeviceTelephoneNumber
                DeviceType = $mobileDevice.DeviceType
                FirstSyncTime = $mobileDevice.FirstSyncTime
                UserDisplayName = $mobileDevice.UserDisplayName
                } 
                $results += New-Object psobject -Property $properties
        }
}
$results | Select-Object Name,UPN,FriendlyName,DisplayName,ClientType,ClientVersion,DeviceId,DeviceMobileOperator,DeviceModel,DeviceOS,DeviceTelephoneNumber,DeviceType,FirstSyncTime,UserDisplayName | Export-Csv -notypeinformation -Path $csv