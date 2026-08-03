# Compile every scenario in scenarios/*.typ to pdfs/<name>.pdf.
# Requires the Typst CLI: winget install --id Typst.Typst
$ErrorActionPreference = 'Stop'

$typst = Get-Command typst -ErrorAction SilentlyContinue
if ($null -eq $typst) {
    $wingetTypst = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Typst.Typst_Microsoft.Winget.Source_8wekyb3d8bbwe\typst-x86_64-pc-windows-msvc\typst.exe"
    if (Test-Path $wingetTypst) { $typst = $wingetTypst }
    else { Write-Error "Typst not found. Install it with: winget install --id Typst.Typst" }
} else {
    $typst = $typst.Source
}

New-Item -ItemType Directory -Force pdfs | Out-Null

Get-ChildItem scenarios -Filter *.typ | Where-Object { $_.BaseName -ne 'template' } | ForEach-Object {
    Write-Host "Compiling $($_.Name)"
    & $typst compile $_.FullName "pdfs\$($_.BaseName).pdf"
    if ($LASTEXITCODE -ne 0) { Write-Error "Failed to compile $($_.Name)" }
}

Write-Host "Done. PDFs are in pdfs\"
