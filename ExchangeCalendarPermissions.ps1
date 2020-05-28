#These commands will set the permissions for a Calendar
#This was used for a calendar that did not show the owner of a booked conference room
##################################################################################### 

Get-MailboxFolderPermission "equipment":\Calendar

Set-MailboxFolderPermission -Identity ""equipment":\calendar" -User Default -AccessRights Reviewer