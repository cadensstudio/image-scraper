function Load-Env {
  param (
    [string]$path
  )
  if (Test-Path $path) {
    Get-Content $path | ForEach-Object {
      if ($_ -match "^\s*([^=]+?)\s*=\s*(.*?)\s*$") {
        $name = $matches[1]
        $value = $matches[2]
        [System.Environment]::SetEnvironmentVariable($name, $value)
      }
    }
  }
  else {
    Write-Error "File not found: $path"
    exit 1
  }
}