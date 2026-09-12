#!/usr/bin/env bash
# Publica datos.pelayoingenieriadigital.es en GitHub Pages.
# Uso, desde esta carpeta:   bash subir.sh
set -e
REPO="datos-comarca"
USUARIO="SergioPelayo"

echo "== 1. Repositorio local =="
if [ ! -d .git ]; then
  git init
  git branch -M main
fi
git add -A
git commit -m "Como se mueve el Campo de Gibraltar" || echo "   (sin cambios que confirmar)"

echo
echo "== 2. Repositorio en GitHub =="
if command -v gh >/dev/null 2>&1; then
  gh repo create "$REPO" --public --source=. --remote=origin --push
  echo "   Activando GitHub Pages..."
  gh api -X POST "repos/$USUARIO/$REPO/pages" -f build_type=workflow || \
    echo "   (si falla, actívalo a mano: Settings > Pages > Source = GitHub Actions)"
else
  echo "   No tienes gh. Haz esto:"
  echo "   a) Crea en github.com un repo PUBLICO y VACIO llamado $REPO"
  echo "   b) Vuelve aqui y ejecuta:"
  echo "        git remote add origin https://github.com/$USUARIO/$REPO.git"
  echo "        git push -u origin main"
  echo "   c) En el repo: Settings > Pages > Source = GitHub Actions"
fi

echo
echo "== 3. DNS, en IONOS =="
echo "   Zona de pelayoingenieriadigital.es, registro nuevo:"
echo "      Tipo:   CNAME"
echo "      Nombre: datos"
echo "      Valor:  sergiopelayo.github.io"
echo "   El mismo tipo que ya tienes para fuelrapido."
echo
echo "== 4. Comprobar =="
echo "   https://datos.pelayoingenieriadigital.es/campo-de-gibraltar/"
