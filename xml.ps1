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

function SubmitCheckPoint ($value)
{

 Copy-Item D:\MT\RMP\Config\UsageServer\usageserver.xml D:\MT\RMP\Config\UsageServer\usageserver_bck.xml
 $xml=[xml](Get-Content D:\MT\RMP\Config\UsageServer\usageserver_bck.xml)
 $xpath="/xmlconfig/Service/SubmitCheckpointsForExecution"
 $xml.SelectSingleNode($xpath)."#text"=$value
 $xml.Save("D:\MT\RMP\Config\UsageServer\usageserver.xml")
}

function ChangeLogLevel ($value)
{

 Copy-Item D:\MT\RMP\Config\Logging\logging.xml D:\MT\RMP\Config\Logging\logging_bck.xml
 $xml=[xml](Get-Content D:\MT\RMP\Config\Logging\logging_bck.xml)
 $xpath="/xmlconfig/logging_config/loglevel"
 $xml.SelectSingleNode($xpath)."#text"=[string]$value
 $xml.Save("D:\MT\RMP\Config\Logging\logging.xml")
}