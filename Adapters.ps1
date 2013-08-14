function runAdapterList([int[]]$listOfAdpaters)
{
    foreach ($adapterId in $listOfAdpaters)
    {
    runAdapterInstance $adapterId
    }
}

function runAdapterInstance
    {
	Param($instanceId) 
    Push-Location
    Set-Location $env:mtrmpbin
    usm run /instance:$instanceId /ignoredeps
    Pop-Location
    }
    
function reverseeAdapterInstanc
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
    
    