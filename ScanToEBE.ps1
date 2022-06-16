#This script will take files uploaded to a source directory and send files to EBE's network directory
#
#Created by Jordan Beauchemin

#This script runs on ****

#Source : C:\EBE-UPLOAD
#Destination: \\****\MFD_Input\BELL_
#credentials ****.local\****** : *********

$files=Get-ChildItem “\\****\public\EBEUPLOAD"

$username = "****.local\******"
$password = "*********"
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, ($password | ConvertTo-SecureString -AsPlainText -Force)

#loop through all files in source directory and copy to network location
Foreach($file in $files)
{

Write-Host “copying file to destion:” $file

#Move-Item C:\ebeTestSource\$file C:\ebeTestDestination
Move-Item \\****\public\EBEUPLOAD\$file \\****-SQL01\MFD_Input\BELL_

}
