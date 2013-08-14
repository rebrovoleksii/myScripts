function genRandomConfId
    {
    $digital = Get-Random -Minimum 1000 -Maximum 9999
    $char=Get-Random -Count 1 -InputObject (65..90) | % {[char]$_}
    
    return $confid = [String]$digital+[String]"-"+[String]$char
    
    }
    
   #new-item -name ConfId.txt -type file
    for ($c=1;$c -le 100; $c++)
    {
    genRandomConfId >>"c:\users\Administrator\desktop\ConfId.txt"
    }