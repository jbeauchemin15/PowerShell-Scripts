# Main menu, allowing user selection
# Do some stuff

$tasks = Get-Content -Path C:\ScheduledTaskManager\ScheduledTasksList.txt

     function Show-Menu
     {
          param (
                [string]$Title = 'Choose Which  to Start'
          )
          cls
          Write-Host "================ $Title ================"
           
       Write-Host "1: Press '1' to Stop Scheduled Tasks"
       Write-Host "2: Press '2' to Disable Scheduled Tasks"
       Write-Host "3: Press '3' to Enable Scheduled Tasks"
       Write-Host "Q: Press 'Q' to quit."
     }
       
     #Functions go here
       
     Function StopScheduledTasks {

     $tasks = Get-Content -Path C:\ScheduledTaskManager\ScheduledTasksList.txt

        ForEach ($task in $tasks) {
            Stop-ScheduledTask -TaskName "$task"

        }

      }
         
     Function DisableScheduledTasks {
     $tasks = Get-Content -Path C:\ScheduledTaskManager\ScheduledTasksList.txt

        ForEach ($task in $tasks) {
            Disable-ScheduledTask -TaskName "$task"

        }
     }
       
     Function EnableScheduledTasks {
     $tasks = Get-Content -Path C:\ScheduledTaskManager\ScheduledTasksList.txt

        ForEach ($task in $tasks) {
            Enable-ScheduledTask -TaskName "$task"

        }
      }
       
     #Main menu loop
     do
     {
          Show-Menu
          $input = Read-Host "Please make a selection"
          switch ($input)
          {
                '1' {
                     cls
                     StopScheduledTasks
                } '2' {
                     cls
                     DisableScheduledTasks
                } '3' {
                     cls
                     EnableScheduledTasks
                }  'q' {
                     return
                }
          }
          pause
     }
     until ($input -eq 'q')
