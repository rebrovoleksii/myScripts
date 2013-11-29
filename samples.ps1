Set-Location d:\_metranet\rmp\extensions\...
$polist = Get-ChildItem | select -ExpandProperty Name
#$path = Get-Location | select -ExpandProperty Path
foreach ($po in $polist)
	{
	xx.bat $po
	}