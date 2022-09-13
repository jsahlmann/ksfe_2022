# Elektronisches Abpausen

## Herausforderung

Es liegt in einer Publikation ein Flussdiagramm oder eine andere strukturierte Grafik wie zum Beispiel ein CONSORT-Diagramm vor, die in eine Publikation übernommen werden soll und mit individuellen Zahlen versehen werden soll.

Das SVG-Format zusammen mit Inkscape und SAS eignet sich gut, um diese Grafik mit relativ wenig Aufwand in eine elektronische Form zu bringen.

## Umsetzung

Das Diagramm wird als Screenshot oder anderweitig als Pixeldatei gespeichert und in Inkscape geöffnet. Beim Speichern des Diagrammes ist zu beachten, dass die Linien und Blöcke des Diagramms möglichst senkrecht oder waagerecht vorliegen sollten. Das erleichtert das Nachzeichnen sehr.

<figure class="image">
  <img src="img\consort.png" alt="CONSORT-Diagramm" style="zoom:50%;" />
  <figcaption>CONSORT-Diagramm als Vorlage</figcaption>
</figure>

Die Ebene, auf der diese Datei liegt, wird als unterste Ebene angelegt und vor Veränderungen geschützt.
Details zu diesen Verfahren finden sich in der Anleitung zu Inkscape. Dieser Text ist nicht als Anleitung für Inkscape gedacht.

Über der Ebene mit der Pixelgrafik wird eine weitere Ebene angelegt, auf der das Nachzeichnen stattfindet.

<figure class="image">
  <img src="img\ebenen.png" alt="Zwei Ebenen">
  <figcaption>Zwei Ebenen mit Pixeldatei und drei Rechtecken</figcaption>
</figure>

Wenn man die Rechtecke zum Nachzeichnen mit einer transparenten Füllung versieht, weiß man, welche man schon bearbeitet hat.

<figure class="image">
  <img src="img\consort_red.png" alt="CONSORT-Diagramm mit drei rot markierten Rechtecken." style="zoom:50%;">
  <figcaption>CONSORT-Diagramm mit drei rot markierten Rechtecken</figcaption>
</figure>

Wenn alle Rechtecke und Pfeile nachgezeichnet sind, hat man die Struktur fertig.

<figure class="image">
  <img src="img\consort_struktur.png" alt="Struktur des CONSORT-Diagramms" style="zoom:50%;">
  <figcaption>Struktur des CONSORT-Diagramms</figcaption>
</figure>

Aus der SVG-Datei kann man jetzt die Koordinaten und die Dimensionen der Rechtecke für das eigene Diagramm ablesen.

<figure class="image">
  <img src="img\struktur_ausschnitt.png" alt="SVG-Datei (Ausschnitt) Struktur des CONSORT-Diagramms" style="zoom:75%;">
  <figcaption>SVG-Datei (Ausschnitt) Struktur des CONSORT-Diagramms</figcaption>
</figure>

Eine mögliche Erweiterung wäre die Automatisierung des Auslesens.