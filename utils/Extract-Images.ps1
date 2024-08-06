function Extract-Images {
  param (
      [string]$tempDir
  )

  # Ensure the media directory exists
  $mediaDir = [System.IO.Path]::Combine((Get-Location).Path, "media")
  if (-not (Test-Path $mediaDir)) {
      [System.IO.Directory]::CreateDirectory($mediaDir)
  }

  # Path to the media directory in the extracted PowerPoint
  $pptMediaDir = [System.IO.Path]::Combine($tempDir, "ppt", "media")
  if (-not (Test-Path $pptMediaDir)) {
      Write-Error "Media directory not found in the extracted PowerPoint files."
      exit 1
  }

  # Get all files in the media directory
  $mediaFiles = Get-ChildItem -Path $pptMediaDir -File
  if ($mediaFiles.Count -eq 0) {
      Write-Host "No media files found in the media directory."
      return
  }

  # Copy each media file to the media directory at the root of the project
  foreach ($mediaFile in $mediaFiles) {
      $destinationPath = [System.IO.Path]::Combine($mediaDir, $mediaFile.Name)
      Copy-Item -Path $mediaFile.FullName -Destination $destinationPath -Force
  }

  Write-Host "Images have been extracted to $mediaDir"
}
