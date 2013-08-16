function runAdapterList([int[]]$listOfAdpaters)
{
    foreach ($adapterId in $listOfAdpaters)
    {
    runAdapterInstance $adapterId
    }
}

function runAdapterInstance
    {
     <#
  .SYNOPSIS
  Allow to run MT adapter via usm tool
  .DESCRIPTION
  This function runs EOP BPA(business processing adapter)
  using usm.exe tool in case you want run standalone adapter
  or adapter in interval with unresolved dependencies 
  Basically yhis function replace next command
  usm run /instance:xxx /ignoredeps
  .EXAMPLE
  runAdapterInstance 1007
  Description
  -----------
  You need to use 4 digit adapter id from MetraControl/DB as parameter.
  .PARAMETER computername
  The computer name to query. Just one.
  .PARAMETER logname
  The name of a file to write failed computer names to. Defaults to errors.txt.
  #>
	Param(
    [ValidateRange(1000,9999)]
    [int]
    $instanceId) 
  
    Push-Location
    Set-Location $env:mtrmpbin
    usm run /instance:$instanceId /ignoredeps
    Pop-Location
    }
    
function reverseAdapterInstance
    {
    Param($instanceId) 
    Push-Location
    Set-Location $env:mtrmpbin
    usm reverse /instance:$id /ignoredeps
    Pop-Location
    }
    
  
function overrideAdapter
    {
    Param(
    [ValidateRange(1000,9999)]
    [Int]
    $id,
    [ValidateSet("s","f","n")]
    [String]
    $status 
    )
    switch($status)
        {
        "f" {$temp="Failed"}
        "s" {$temp="Succeeded" }
        "n" {$temp="NotYetRun"}
        default {$temp = "Succeeded"}
        }
    
    Push-Location
    Set-Location $env:mtrmpbin
    usm override /instance:$id /status:$temp 
    Pop-Location
    }
    
    