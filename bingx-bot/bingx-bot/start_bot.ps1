# start_bot.ps1

$botDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$pidFile = Join-Path $botDir "bot.pid"

# Kill process cu neu con chay
if (Test-Path $pidFile) {
    $oldPid = Get-Content $pidFile -Raw
    try {
        Stop-Process -Id ([int]$oldPid) -Force -ErrorAction SilentlyContinue
    } catch {}
    Remove-Item $pidFile -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
}

# Chay bot an voi priority thap — khong tranh CPU voi app khac
$proc = Start-Process -FilePath "python" `
                      -ArgumentList "bot.py" `
                      -WorkingDirectory $botDir `
                      -WindowStyle Hidden `
                      -PassThru

# Dat priority BelowNormal de may khong bi lag
Start-Sleep -Milliseconds 500
$proc.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::BelowNormal
