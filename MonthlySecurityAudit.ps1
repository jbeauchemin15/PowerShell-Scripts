Get-ADGroupMember -identity BT_Accounting -Recursive | select name | Export-Csv D:\MonthlySecurityGroupAudits\BTAccounting\$(get-date -f yyyy-MM-dd)BTAccounting.csv -NoTypeInformation

Get-ADGroupMember -identity BT_HumanResources -Recursive | select name | Export-Csv D:\MonthlySecurityGroupAudits\BTHumanResources\$(get-date -f yyyy-MM-dd)BTHumanResources.csv -NoTypeInformation

Get-ADGroupMember -identity BT_Management -Recursive | select name | Export-Csv D:\MonthlySecurityGroupAudits\BTManagement\$(get-date -f yyyy-MM-dd)BTManagement.csv -NoTypeInformation
