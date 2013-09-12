function StartAllMTServices
    {
    
    Start-Service iisadmin
    Start-Service activityservices
    Start-Service w3svc
    Start-Service msmq /y
    Start-Service metrapay
    Start-Service MetraTechDataExportService
    Start-Service pipeline
    Start-Service metratech.fileservice
    Start-Service billingserver
    }

    
function StopAllMTServices
    {
    
    Stop-Service pipeline
    Stop-Service activityservices
    Stop-Service iisadmin /y
    Stop-Service w3svc
    Stop-Service msmq /y
    Stop-Service metrapay
    Stop-Service metratech.fileservice
    Stop-Service billingserver
    Stop-Service MetraTechDataExportService
    }
    
function ViewMTServices 
	{	
    	Get-Service | Where-Object {$_.DisplayName -like "Metra*" -or $_.DisplayName -like "IIS*"}
	}
    
    