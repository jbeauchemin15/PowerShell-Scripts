    #Created by Jordan Beauchemin
    #
    #Date: 07/82/2017
    #
    #This script check the TMW Service (EDI Communications Manager)7 to see if it is running.
    #If the service is not running it sends out an email and rechecks the service.
    #It will continue to recheck the service until it is back online and will
    # send out an email that the service is back online.

    $ServiceName = "MadHostSvc7"
    $arrService = Get-Service -name $ServiceName
    $increment = 0

    if($arrService.Status -ne "Running") {
       
        do {
            $arrService.Status

            if($increment -le 4) {

            Write-Host "$ServiceName is not running" -foregroundcolor black -backgroundcolor red

            $To = "Jordan Beauchemin <jordanb@bellavancetrucking.com>, Ben Wilkens <benw@bellavancetrucking.com>"

            Write-Host "Sending email to $To...     " -foregroundcolor white -backgroundcolor blue

            $From = "jordanb@bellavancetrucking.com"
            $Subject    = "***** StoredProcedures is NOT Running *****"
            $Body       = "The following service is NOT Running: StoredProcedures"
            $SMTPServer = "smtp.gmail.com"
            $SMTPMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body)
            $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
            $SMTPClient.EnableSsl = $true
            $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("jordanb@bellavancetrucking.com", "");
            $SMTPClient.Send($SMTPMessage)

            $increment++
            write-host "Increment is: $increment"
            } else {}

            Get-Service -Name $ServiceName -ComputerName BELL-AGT01 | Start-Service

            Start-Sleep -s 60

            $ServiceName = "MadHostSvc7"
            $arrService = Get-Service -name $ServiceName
            $arrService.Status

    } until ($arrService.Status -eq "Running" -or $arrService.Status -eq "Started" )

        $increment = 0

        $To = "Jordan Beauchemin <jordanb@bellavancetrucking.com>, Ben Wilkens <benw@bellavancetrucking.com>"
       
        Write-Host "Sending email to $To...     " -foregroundcolor white -backgroundcolor blue

        $From = "jordanb@bellavancetrucking.com"
        $Subject    = "***** StoredProcedures is Running *****"
        $Body       = "The following service is Running: StoredProcedures"
        $SMTPServer = "smtp.gmail.com"
        $SMTPMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body)
        $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
        $SMTPClient.EnableSsl = $true
        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("jordanb@bellavancetrucking.com", "");
        $SMTPClient.Send($SMTPMessage)

    Write-Host "$ServiceName is running." -foregroundcolor black -backgroundcolor green

    } else {
        $arrService.Status
        Write-Host "$ServiceName is running." -foregroundcolor black -backgroundcolor green

    }
