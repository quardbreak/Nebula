$x86 = "$Env:SystemRoot\System32\F12\IEChooser.exe"
$x64 = "$Env:SystemRoot\SysWOW64\F12\IEChooser.exe"

if (Test-Path $x64) {
    Start-Process -FilePath $x64
}
elseif (Test-Path $x86) {
    Start-Process -FilePath $x86
}
else {
    Write-Error "IEChooser.exe not found."
}
