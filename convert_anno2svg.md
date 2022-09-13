 Annotate-Datensätze als SVG weiterverwenden

## Abgrenzung

In diesem Text beziehen sich Annotate-Datensätze auf solche, die mit %sganno und den dadurch geladenen Makros erzeugt und in den SGPLOT-Prozeduren genutzt werden können.

Berücksichtigt worden sind die folgenden Makros:

- %SGARROW
- %SGIMAGE
- %SGLINE
- %SGOVAL
- %SGPOLYCONT
- %SGPOLYGON
- %SGPOLYLINE
- %SGRECTANGLE
- %SGTEXT
- (%SGTEXTCONT)

## Makros

Die Makros aus der Datei [macros_jsvg_create.sas](makros/macros_jsvg.sas) sind ein erster Versuch, Annotate-Datensätze in SVG-Dateien umzuwandeln. Die Datei kann als solche in SAS geöffnet und ausgeführt werden. Sie stellt die Makros bereit, die die einzelnen Funktionen umwandeln.

Das Makro [%map2svg(ds, svgfile);](makros/map2svg.sas) steuert das Einlesen des Annotate-Datensatzes und ruft die zugehörigen Makros für die Verarbeitung der einzelnen Funktionen auf.

Parameter:

- ds: Annotate-Datensatz
- svgfile: Pfad und Name der zu erzeugenden SVG-Datei

## Einschränkungen

Bei der Umwandlung fallen bestimmte Umstände auf, die eine 1:1 Umwandlung umständlich und nicht eindeutig machen.

### Orientierung des Koordinatensystems

Das Koordinatensystem bei Annotate hat seinen Ursprung links unten. Bei SVG hat es seinen Urspring links oben.

Man muss also die y-Koordinaten invertieren. Das führt dazu, dass auch eingebundene Grafiken an der y-Achse gespiegelt werden müssen.

<figure class="image">
  <img src="img\vergleich1.png" alt="Ursprung des Koordinatensystems unterschiedlich" style="zoom:60%;" />
  <figcaption>Ursprung des Koordinatensystems unterschiedlich</figcaption>
</figure>

### Pfeilmarker als eigenständige Objekte

Bei Annotate gibt es mit ARROW die Pfeilspitze an der Linie. Bei SVG muss die Pfeilspitze eigenständig definiert werden und dann eingebunden werden.

<figure class="image">
  <img src="img\vergleich2.png" alt="Pfeilspitzen als eigenständige Objekte" style="zoom:50%;" />
  <figcaption>Pfeilspitzen als eigenständige Objekte</figcaption>
</figure>

### POLYCONT aufwändig umzusetzen

Bei Annotate beendet POLYCONT den Streckenzug automatisch, wenn eine andere Funktion aufgerufen wird. Bei SVG gibt es diese Funktionalität so nicht. Man muss verfolgen, ob gerade ein Streckenzug gezeichnet wird und diesen dann in die SVG-Datei schreiben, wenn eine andere Funktion benutzt wird.

<figure class="image">
  <img src="img\vergleich3.png" alt="xxxCONT aufwändig oder gar nicht umsetzbar" style="zoom:50%;" />
  <figcaption>xxxCONT aufwändig oder gar nicht umsetzbar</figcaption>
</figure>

### TEXTCONT nicht umzusetzen

Für TEXTCONT hatte ich keine Idee der Umsetzung, da SVG die BoundingBox für einen Textstring nicht zurückgibt. Diese braucht man, wenn man den nächsten Text nahtlos an den vorigen anhängen will.

### Bezugspunkte wie ANCHOR aufwändig umzusetzen

Die unterschiedlichen Bezugssystem brauchen eine aufwändige Fallunterscheidung, damit die Umrechnung korrekt erfolgt. Für das Rechteck wurde es probehalber in SVG umgesetzt.

<figure class="image">
  <img src="img\vergleich4.png" alt="Bezugssysteme erfordern aufwändige Fallunterscheidungen" style="zoom:50%;" />
  <figcaption>Bezugssysteme erfordern aufwändige Fallunterscheidungen</figcaption>
</figure>

## Fazit

Das Makro reicht in der aktuellen Form aus, um einen Eindruck des Inhaltes des Annotate-Datensatzes zu bekommen, der dann händisch nachgearbeitet werden kann.

Es ist noch nicht geeignet, um automatisch und unbeaufsichtigt Umwandlungen durchzuführen.

Eine Erweiterung lohnt sich dann, wenn der Bedarf besteht. Diese Erweiterung kann individuell sein, da die Schwerpunkte unterschiedlich liegen können.
