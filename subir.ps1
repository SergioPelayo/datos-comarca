# Publica datos.pelayoingenieriadigital.es en GitHub Pages.
# Ejecutar desde esta misma carpeta:  .\subir.ps1

$ErrorActionPreference = "Stop"
$repo = "datos-comarca"

Write-Host "== 1. Repositorio local ==" -ForegroundColor Cyan
if (-not (Test-Path ".git")) {
    git init
    git branch -M main
}
git add -A
git commit -m "Como se mueve el Campo de Gibraltar" 2>$null
if ($LASTEXITCODE -ne 0) { Write-Host "   (sin cambios que confirmar)" }

Write-Host "== 2. Repositorio en GitHub ==" -ForegroundColor Cyan
if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh repo create $repo --public --source=. --remote=origin --push
    Write-Host "   Activando GitHub Pages..."
    gh api -X POST "repos/:owner/$repo/pages" -f build_type=workflow 2>$null
} else {
    Write-Host "   No tienes gh instalado. Haz esto a mano:" -ForegroundColor Yellow
    Write-Host "   a) Crea en github.com un repo PUBLICO llamado $repo, vacio."
    Write-Host "   b) Luego ejecuta:"
    Write-Host "      git remote add origin https://github.com/SergioPelayo/$repo.git"
    Write-Host "      git push -u origin main"
    Write-Host "   c) En Settings > Pages, pon Source = GitHub Actions."
}

Write-Host ""
Write-Host "== 3. DNS (esto va en IONOS, no aqui) ==" -ForegroundColor Cyan
Write-Host "   En la zona DNS de pelayoingenieriadigital.es, anade:"
Write-Host ""
Write-Host "      Tipo:   CNAME"
Write-Host "      Nombre: datos"
Write-Host "      Valor:  sergiopelayo.github.io"
Write-Host ""
Write-Host "   Es el mismo tipo de registro que ya tienes para fuelrapido."
Write-Host ""
Write-Host "== 4. Comprobar ==" -ForegroundColor Cyan
Write-Host "   - https://datos.pelayoingenieriadigital.es/campo-de-gibraltar/"
Write-Host "   - En Settings > Pages debe salir el candado de HTTPS (tarda un rato)."
Write-Host "   - ANTES de pegar el enlace en Facebook, pasalo por:"
Write-Host "     https://developers.facebook.com/tools/debug/  y pulsa 'Volver a extraer'."
