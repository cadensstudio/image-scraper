. .\utils\Load-Env.ps1
. .\utils\Unzip-Powerpoint.ps1
. .\utils\Extract-Images.ps1

Load-Env -path ".env"

Unzip-Powerpoint -filePath $env:FILEPATH

$tempDir = [System.IO.Path]::Combine((Get-Location).Path, "tmp")
Extract-Images -tempDir $tempDir

Remove-Item -Path "tmp" -Recurse -Force