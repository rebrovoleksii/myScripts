function goDesk
	{
    <#
    .DESCRIPTION
    Change current directory to Desktop
    #>
    
		Set-Location C:\Users\Administrator\Desktop
	}

function goScripts
	{
    <#
    .DESCRIPTION
    Change current directory to D:\..\RMP-Extensions-TestSystem_Internal\Scripts
    #>
    
		Set-Location $env:testsystem\Scripts
	}
    
function openAATresults
	{
    <#
    .DESCRIPTION
    Change current directory to D:\..\RMP-Extensions-TestSystem_Internal\Scripts
    #>
        Param($mtrmp)
        
        $gitMtDir
       
        if($mtrmp -match "mtrmp")
        {
            Set-Location $env:MTRMPBIN\TestResults 
            ii .
        }
                
        else
        {
		  foreach ($dir in Get-ChildItem D:\) {
                $dir.Name -match "git.MetraNet" | %{if($_) {$gitMtDir=$dir.Name}}
                }
          Set-Location D:\$gitMtDir\RMP\Extensions\coreQA_Source_Internal\TestResults
          ii .
        }
        
	}

function runTDtest
	{
		Param($suitePath)
		Set-Location $Env:MTRMPBIN
        MTTestdriver.exe /e $env:TestS $suitePath c:\_results.xml
	}


function startMetraNet
    {
    ie localhost\MetraNet
    }
    

function startMetraView
    {
    ie localhost\MetraView
    }    
    
