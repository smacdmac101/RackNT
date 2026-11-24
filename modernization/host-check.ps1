# Run inside the intended RosBE or developer prompt to check PATH.
$ErrorActionPreference = 'Stop'
$commands = 'git', 'cmake', 'ninja', 'qemu-img', 'qemu-system-i386'
$missing = @()
foreach ($command in $commands) {
    $tool = Get-Command $command -CommandType Application -ErrorAction SilentlyContinue
    if ($tool) {
        $tool | Select-Object -First 1 Name, Source | Format-Table -HideTableHeaders
    }
    else {
        $missing += $command
    }
}
if ($missing.Count) {
    Write-Error "Missing from PATH: $($missing -join ', ')"
}
