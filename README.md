# datos.pelayoingenieriadigital.es

Datos públicos del Campo de Gibraltar, recogidos y explicados con la fuente al lado.
Sitio estático servido por GitHub Pages. Cada entrada es una carpeta con su `index.html`.

    /                        índice de la serie
    /campo-de-gibraltar/     Cómo se mueve el Campo de Gibraltar (12/09/2026)

## Publicar un cambio

    git add -A && git commit -m "..." && git push

El workflow de Actions despliega solo al empujar a `main`.

## Añadir una entrada

1. Carpeta nueva con `index.html` y sus imágenes.
2. Enlazarla desde el `index.html` de la raíz.
3. Añadir la URL a `sitemap.xml`.
4. Comprobar `og:url`, `canonical` y `og:image` de la entrada nueva.

## Después de publicar algo que vaya a redes

Pasar la URL por el depurador de Facebook y pedir que vuelva a extraer, ANTES de
pegar el enlace en un post. Facebook cachea la primera lectura y si la coge sin
la imagen se queda con la versión fea para siempre:

    https://developers.facebook.com/tools/debug/
