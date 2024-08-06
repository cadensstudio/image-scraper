function Unzip-Powerpoint {
  param (
    [string]$filePath
  )

  if (-not (Test-Path $filePath)) {
    Write-Error "File not found: $filePath"
    exit 1
  }

  # Create tmp directory for unzipped PowerPoint
  $currentDir = Get-Location
  $tempDir = [System.IO.Path]::Combine($currentDir.Path, "tmp")
  if (-not (Test-Path $tempDir)) {
    [System.IO.Directory]::CreateDirectory($tempDir)
  } else {
    Remove-Item -Path $tempDir -Recurse -Force
    [System.IO.Directory]::CreateDirectory($tempDir)
  }

  [System.IO.Compression.ZipFile]::ExtractToDirectory($filePath, $tempDir)

  Write-Host "PowerPoint file unzipped to $tempDir"
}
