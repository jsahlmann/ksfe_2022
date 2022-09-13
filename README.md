# SVGs mit SAS handgemacht

## Warum SVG mit SAS?

SVG-Dateien und ihre Erstellung ist ein sinnvolles Werkzeug in der Werkzeugkiste für SAS-Programmierer.

SVG ist ein universelles Format, dessen Spezifikation bei der W3-Organisation beschrieben wird: [SVG Beschreibung](https://www.w3.org/TR/SVG2/)

Ein einfaches Tutorial findet sich auf der [W3-Schools Tutorial für SVG.](https://www.w3schools.com/graphics/svg_intro.asp)

Die Dateien sind ASCII-Datei, die mit jedem Texteditor bearbeitbar sind.

Die Erzeugung von SVG-Dateien innerhalb von SAS erfordert keinen Programmwechsel.

SVG-Dateien können in HTML-Ausgaben direkt eingebunden werden.

Die Erstellung kann mit Makrovariablen parametrisiert erfolgen.

## Einfache SVG-Datei

Das erste SVG-Beispiel auf W3-Schools zeichnet einen gelben Kreis mit einer grünen Kontur.

~~~ SVG
``` SVG
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">
  <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
</svg>
```
~~~

<img src="img\circle1.png" alt="Kreis-Beispiel" style="zoom:50%;" />

Dieser Code kann direkt in eine HTML-Datei eingebunden werden.

~~~ HTML
``` HTML
``` HTML
<html>
<body>

<h1>My first SVG</h1>

<svg width="100" height="100">
  <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
</svg>

</body>
</html>
```
````
~~~

Der Kreis wird im Browser dargestellt.

## Erste Makros zur Erzeugung von SVG-Dateien

Die Makros zur Generierung von SVG-Dateien findet finden sich in der Datei [macros_jsvg_create.sas](makros/macros_jsvg_create.sas).

Diese Datei kann in SAS geöffnet und insgesamt ausgeführt werden.

- %macro svg_init(ds, wpx = 1000, hpx = 1000);

- %macro svg_close(ds);

- %macro svg_ellipse(ds, cx, cy, rx, ry, stroke="black", fill="white");

- %macro svg_line(ds, x1, y1, x2, y2, stroke="black", strokewidth=1);

- %macro svg_rect(ds, x, y, width, height, stroke="black", fill = "white");

- %macro svg_copy(ds, dsadd);

- %macro svg_write(ds, svgfile);

## Grundsätzliche Nutzung

Mit %svg_init wird die Erzeugung einer neuen SVG-Datei eingeleitet und der Header geschrieben. Die Variable ds enthält den Namen des Datensatzes, der die Grundlage für die SVG-Datei bildet und den Fortschritt speichert. Mit den Variablen wpx und hpx können Breite und Höhe der Datei in Pixeln vorgegeben werden.

Mit %svg_close wird die Erzeugung einer SVG-Datei abgeschlossen und die Endzeilen geschrieben.

Mit %svg_write wird der Datensatz in eine tatsächliche SVG-Datei kopiert.

Beispiele finden sich im Ordner makros unter spirale.sas, spirale_square.sas und sierpinski.sas.

## Ausgabe im Browser oder Inkscape

SVG-Dateien können in den aktuellen Browsern direkt angezeigt werden oder in [Inkscape](https://inkscape.org/) angezeigt und bearbeitet werden.

Inkscape ist ein Vektorzeichenprogramm, das OpenSource und frei verfügbar ist.

Wenn die Makros zur Erzeugung von SVG-Dateien geladen sind, können die Programme zur Erzeugung der drei folgenden Kurven direkt ausgeführt werden.

### Spirale

Zeichnen einer Spirale mit [spirale.sas](makros/spirale.sas).

<img src="img\spirale.png" alt="Spirale" style="zoom:75%;" />

### Rechteckige Spirale

Zeichnen einer quadratischen Spirale mit [spirale_square.sas](makros/spirale_square.sas).

<img src="img\spirale_square.png" alt="Quadratische Spirale" style="zoom:75%;" />

### Sierpinski-Kurve

Zeichnen einer Sierpinski-Kurve mit [sierpinski.sas](makros/sierpinski.sas).

<img src="img\sierpinski.png" alt="Sierpinski-Kurve" style="zoom:50%;" />
