#Pull list from a text file or a csv without headers
$Hosts = Get-Content C:\PowerShellScripts\ExcludedServers.txt

foreach ($PC in $Hosts) {
    if (Test-Connection $PC -Count 1) {
    $License = (Get-WmiObject SoftwareLicensingService -ComputerName $PC).OA3xOriginalProductKey

    $csv =          [PSCustomObject]@{
                    License      = $License
                    Computername = $PC
                }
          
        }
    }

#Write the table to PS screen
Write-Output $csv

#Export the table to CSV
$csv | export-csv -Path c:\PowerShellScripts\license.csv -NoTypeInformation
