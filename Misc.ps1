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