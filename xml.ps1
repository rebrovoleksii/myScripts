function displayUsefulXML
{
 $xmlUsageServer=[xml](Get-Content D:\MT\RMP\Config\UsageServer\usageserver.xml)
 $xmlLogging=[xml](Get-Content D:\mt\RMP\Config\Logging\logging.xml)
 
 
 $logginLevel = [string]$xmlLogging.xmlconfig.logging_config.loglevel.InnerText
 $SubmitCheckpointsForExecution=[string]$xmlUsageServer.xmlconfig.Service.SubmitCheckpointsForExecution
 
 $arrayToDisplay =  @{"logginLevel"=$logginLevel;"SubmitCheckpointsForExecution"=$SubmitCheckpointsForExecution}
 
 foreach ($el in $arrayToDisplay.Keys)
 {
 Write-Host $el "-" $arrayToDisplay.Get_Item($el)
 
 }
 
}

function MT_SubmitCheckPoint ($value)
{
 $workingPath = "D:\MT\RMP\Config\UsageServer"
 #debug path
 #$workingPath = "C:\Users\Administrator\Desktop" 
 $filename = "usageserver.xml"
 $xpath="/xmlconfig/Service/SubmitCheckpointsForExecution"
 if (-not(Test-Path "$workingPath\usageserver_bck.xml"))
    {
    Copy-Item "$workingPath\$filename" "$workingPath\usageserver_bck.xml"
    }
 ChangeXmlNodeValue "$workingPath\$filename" $xpath $value
}


function MT_ChangeLogLevel ($value)
{
 $workingPath = "D:\MT\RMP\Config\Logging"
 #debug path
 #$workingPath = "C:\Users\Administrator\Desktop"
 $filename = "logging.xml"
 $xpath="/xmlconfig/logging_config/loglevel"
 
 if (-not(Test-Path "$workingPath\logging_bck.xml"))
    {
    Copy-Item "$workingPath\$filename" "$workingPath\logging_bck.xml"
    }
    
  ChangeXmlNodeValue "$workingPath\$filename" $xpath $value
}


#region Helpers
function ChangeXmlNodeValue($file,$xpath,$value)
{
$xml=[xml](Get-Content $file)
$xml.SelectSingleNode($xpath).InnerText=$value
$xml.Save($file)
}

#endregion