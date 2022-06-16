cls

$computers = get-adcomputer -Filter *

foreach ($computer in $computers) {
  if (Test-Connection -count 1 -computer $computer.Name -quiet) {
    Write-Host "Updating system" $computer.Name "....." -ForegroundColor Green
    Set-Service –Name remoteregistry –Computer $computer.Name -StartupType Automatic
    Get-Service remoteregistry -ComputerName $computer.Name | start-service
    echo $computer.Name >> C:\scripts\Inventory\onlinelineRemoteRegStartup.txt
  }
  else {
    Write-Host "System Offline " $computer.Name "....." -ForegroundColor Red
    echo $computer.Name >> C:\scripts\Inventory\offlineRemoteRegStartup.txt
   }
 }
