function changeXml ($value)
{
 Copy-Item D:\MT\RMP\Config\UsageServer\usageserver.xml D:\MT\RMP\Config\UsageServer\usageserver_bck.xml
 $xml=[xml](Get-Content D:\MT\RMP\Config\UsageServer\usageserver_bck.xml)
 $xpath="/xmlconfig/Service/SubmitCheckpointsForExecution"
 $xml.SelectSingleNode($xpath)."#text"=$value
 $xml.Save("D:\MT\RMP\Config\UsageServer\usageserver_bck.xml")
}
