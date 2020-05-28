Import-CSV "CSV-PATH" | ForEach-Object {

    $UPN=$_.Email
    
    $Users = Get-MsolUser -UserPrincipalName $UPN
    
    $Groupid = Get-MsolGroup -ObjectId "Group ID"�
    
    $Users | ForEach-Object {Add-MsolGroupMember -GroupObjectId $GroupID.ObjectID -GroupMemberObjectId $Users.ObjectID -GroupMemberType User}
    
    }