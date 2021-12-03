netstat -ano | Where-Object {$_ -match 'UDP|TCP'} | ForEach-Object {
$veriler = $_.Trim() -split "\s+"
[pscustomobject][ordered]@{
    "Local Address" = $veriler[1].Split(':')[-1]
    "ProcessId" = $veriler[4]
    "Process Name" = $(Get-Process -Id $veriler[-1]).ProcessName 

}
}
$veriler > C:\Users\Samet\Desktop\Yeni\test.txt


