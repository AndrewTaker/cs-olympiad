$url = "https://aka.ms/vs/17/release/vs_buildtools.exe"
$installerPath = "$env:TEMP\vs_buildtools.exe"

Write-Host "Downloading Visual Studio Build Tools 2022..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $installerPath

$installArgs = @(
    "--quiet", 
    "--wait", 
    "--norestart", 
    "--nocache",
    "--add", "Microsoft.VisualStudio.Workload.VCTools",
    "--includeRecommended"
)

Write-Host "Installing C++ Build Tools (this may take 10-15 minutes)..." -ForegroundColor Cyan
$process = Start-Process -FilePath $installerPath -ArgumentList $installArgs -Wait -PassThru
Remove-Item $installerPath -ErrorAction SilentlyContinue

if ($process.ExitCode -eq 0 -or $process.ExitCode -eq 3010) {
    Write-Host "Installation successful! (Note: Exit code 3010 means a restart is required)." -ForegroundColor Green
} else {
    Write-Host "Installation failed with exit code: $($process.ExitCode)" -ForegroundColor Red
}
