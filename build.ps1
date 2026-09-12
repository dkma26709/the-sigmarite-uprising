# Compile every scenario in scenarios/*.typ and every army sheet in
# factions/*/army.typ twice:
#   pdfs/<name>.pdf        the full colour edition
#   pdfs/<name>-print.pdf  print-friendly: no cover art, greyscale on white
# Army sheets are named after their faction folder: pdfs/<faction>-army.pdf
# The repo is passed as --root so army sheets can import ../../scenarios/template.typ.
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

function Compile-Document($src, $name) {
    Write-Host "Compiling $name"
    & $typst compile --root $PSScriptRoot $src "pdfs\$name.pdf"
    if ($LASTEXITCODE -ne 0) { Write-Error "Failed to compile $src" }

    Write-Host "Compiling $name (print)"
    & $typst compile --root $PSScriptRoot --input print=true $src "pdfs\$name-print.pdf"
    if ($LASTEXITCODE -ne 0) { Write-Error "Failed to compile $src (print)" }
}

Get-ChildItem scenarios -Filter *.typ | Where-Object { $_.BaseName -ne 'template' } | ForEach-Object {
    Compile-Document $_.FullName $_.BaseName
}

Get-ChildItem factions -Directory | ForEach-Object {
    $src = Join-Path $_.FullName 'army.typ'
    if (Test-Path $src) { Compile-Document $src "$($_.Name)-army" }
}

Write-Host "Done. PDFs are in pdfs\"
