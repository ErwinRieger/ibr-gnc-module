
IBR Gnucash Erweiterungen
##########################

:tags: GnuCash
:slug: gnucash-erweiterungen


.. contents:: Inhalt
 

Kompatibilität und Weiterentwicklung
====================================

Dieses Modul wurde mit GnuCash v3.8 erfolgreich getestet.

Alternativ gibt es eine `Neuentwicklung dieses Moduls in Python (PyGnc) <http://www.ibrieger.de/pygnc-buchhaltung-mit-gnucash-aqbanking-and-python.html>`_.

Github Mirror, Projekt Homepage
===============================

Die aktuellen Quellen gibt es hier: `https://github.com/ErwinRieger/ibr-gnc-module <https://github.com/ErwinRieger/ibr-gnc-module>`_.

Projekt-Webseite: `http://www.ibrieger.de/gnucash-erweiterungen.html <http://www.ibrieger.de/gnucash-erweiterungen.html>`_.

Einleitung
=============

Da ich zur Buchhaltung  in meiner Firma `GnuCash <http://gnucash.org>`_
einsetze und mir die eine oder andere Funktionalität gefehlt hat, habe
ich ein paar Erweiterungen für GnuCash programmiert.

Diese Erweiterungen in Form eines Scheme-Moduls stehen unter der
`GPL <http://www.fsf.org/licensing/licenses/gpl.html>`_, Benutzung auf
eigene Gefahr ("save early, save often", Backups machen). Bei Problemen
oder Anregungen bitte Email an `mich <mailto:erwin.rieger@ibrieger.de>`_.

Die Funktionen des Moduls lassen sich in drei Kategorien einteilen:

#. Prüfung von Buchungen:

   - Prüfung (und ggf. das automatische Anlegen) von Umsatz-/Vorsteuerbuchungen.
   - Prüfung des Jahresabschluss.

#. CSV-Datenexport für Steuerberater/Datev:
   Export der Buchungen eines bestimmten Zeitraumes in eine CSV Datei die vom
   Steuerberater eingelesen werden kann.

#. Verwaltung von Anlagen (Abschreibungen, AFA)


Installation des IBR Moduls
=============================
 

Unter Windows:
+++++++++++++++

-  

   Datei ibr-gnc-module.zip in der entsprechenden Version `hier
   herunterladen </atom.xml#download>`_ und
   entpacken.
-  

   Das installationsscript "Install.bat" ausführen. Dadurch werden die
   dateien ibr-gnc-module.scm und config-user.scm nach 
   %userprofile%\\.gnucash kopiert).
-  

   Die Desktop-Verknüpfung "GnuCash Extra" auf den Desktop verschieben,
   diese startet GnuCash mit dem für die Erweiterungen notwendigen
   Parameter "-extra".
-  

   Falls alles funktioniert hat, sind die Gnucash-Erweiterungen nach
   einem Neustart von Gnucash mit der Option "--extra" als neuer
   Menüpunkt "IngRieger" unterhalb des "Erweiterungen" Menüs sichtbar.


Unter Linux/Unix:
+++++++++++++++++++

-  

   Datei ibr-gnc-module.tgz in der entsprechenden Version `hier
   herunterladen </atom.xml#download>`_ und
   entpacken.
-  

   Die Datei ibr-gnc-module.scm nach $HOME/.gnucash kopieren.
-  

   Die Datei config-user.scm nach $HOME/.gnucash kopieren (oder deren Inhalt
   entsprechend anpassen falls dort schon eigene Modifikationen
   enthalten sind).
-  

   Falls alles funktioniert hat, sind die Gnucash-Erweiterungen nach
   einem Neustart von Gnucash mit der Option "--extra" als neuer
   Menüpunkt "IngRieger" unterhalb des "Erweiterungen" Menüs sichtbar.

DescValues
===============


Zusatzinformationen für das IBR Modul werden im Kontenrahmen
gespeichert. Dies geschieht durch Eintragen bestimmter
Schlüsslel-Wert-Paare in das Beschreibungsfeld der Konten. Damit lassen
sich z.B. Beziehungen zwischen Konten und Steuersätze speichern. Die
Erklärung der einzelnen DescValues erfolgt im folgenden in der
Beschreibung der jeweiligen Funktion.

DescValues werden in der Kontenhierarchie an Unterkonten vererbt.

Prüfung von Buchungen
======================

 

Prüfung Buchungen
+++++++++++++++++++++

 

**Menüpunkt:** Erweiterungen -> IngRieger -> Prüfung Buchungen

Mit dieser Funktion lässt sich das Vorhandensein und die Korrektheit von
z.B. Umsatz-/Vorsteuer-Buchungen testen. Auf Wunsch werden fehlende
Teilbuchungen automatisch eingefügt.

**DescValues:**

-  

   "GK=<SollKontoNummer\|HabenKontoNummer>" Hiermit wird ein Gegenkonto
   definiert, auf das ein Teil des Bruttobetrages gebucht werden soll.
   Beispiel: Mit "GK=1405" lässt sich die Vorsteuer aus einem
   Ausgabenkonto in das entsprechende Vorsteuerkonto 1405 buchen.
-  

   Der umzubuchende Anteil muss im Zielkonto mit einem "Tara" DescValue
   definiert werden. Tara lässt sich als konstanter Wert angeben oder
   als Prozentwert. Da sich prozentuale Angaben auf den Brutto- odere
   auf den Netto-Wert beziehen können, gibt es zwei verschiedene Tara
   Schlüssel: "BTARA" (bezieht sich auf den Bruttowert einer Buchung)
   und "NTARA" (bezieht sich entsprechend auf den Nettowertt).

   Beispiele:

   "NTARA=19%" Buchung von Umatzsteuer/Vorsteuer, 19% vom Netto-Wert auf
   das Gegenkonto.

   "BTARA=20%" Buchung einer Privatentnahme von 20% vom Brutto-Wert auf
   das Gegenkonto.

   "NTARA=50" oder "BTARA=50" Buchung eines Konstanten Betrages von 50
   auf das Gegenkonto.

Prüfung Jahresabschluss
+++++++++++++++++++++++++++++

 

**Menüpunkt:** Erweiterungen -> IngRieger -> Prüfung Jahresabschluss

**DescValues:**

-  

   "NULLSALDO": Dieses Konto soll beim Jahresabschluss auf 0
   abgeschlossen worden sein.

CSV Datenexport für Steuerberater/Datev
===========================================

 

**Menüpunkt:** Erweiterungen -> IngRieger -> CSV Export

Hiermit können die Buchungsdaten im sogenannten CSV-Format ("comma
separated values", ascii) in eine Datei exportiert werden. Ich benutze
diese Funktion um meine Buchhaltungsdaten zum Steuerberater zu
übertragen.

Dies ist KEIN export im DATEV-Format (DTAUS, "DATEV Diskette").

Mein Steuerberater kann dann diese Datei in sein "DATEV
Kanzlei-Rechnungswesen 3.X" Programm importieren.

**Berichtsoptionen**

Der Zeitraum der zu exportierenden Buchungen kann in den Optionen
eingestellt werden.

Die checkbox "Daten im CSV Format exportieren" in den Berichtsoptionen
muss aktiviert werden, um die CSV-Datei anzulegen. Grund für diese etwas
umständliche Vorgehensweise ist die eigenschaft von GnuCash, die
Berichte bei jedem Start des Programms neu auszuführen. Um zu
verhindern, dass bei jedem Start von GnuCash eine neue CSV-Exportdatei
angelegt wird, gibt es diese option, die vom Benutzer explizit aktiviert
werden muss. Ist die Checkbox beim Laden des Berichts nicht aktiviert,
so erscheint eine entsprechende Warnung im Bericht.

 

\ **Kontennummern in der Exportdatei**

 

Als Datev-Kontonummer wird beim Export die Gnucash-Kontonummer benutzt.

 

**Kontennummern beim Export umbenennen**

Mit Hilfe des DescValues "ExportKNR=<kontonummer>" können Kontennummern
beim Export umbenannt werden um so die Buchungen dem Kontenrahmen des
Steuerberaters anzupassen. Die Buchungen tauchen dadurch in der
exportieren Datei in einem anderen Konto auf. Dies ermöglicht es, mit
einem leicht anderen Kontenrahmen als der Steuerberater zu arbeiten.

Betrachten wir z.b. das Konto "Privat Entnahmen 2100": Ich benutze in
meinem Kontenrahmen neben dem Konto 2100 für allgemeine Privatentnahmen
ein weiteres Konto "Privat Entnahme Telefon" um die entsprechenden
Buchungen gesondert zu sammeln. Das Konto "Privat Entnahme Telefon" hat
die "inoffizielle" Kontonummer 2100A bekommen. Nun kennt der
Kontenrahmen beim Steuerberater ja nicht mein "spezialkonto 2100A" was
beim Import zu Problemen führen würde. Deshalb wird das Konto 2100A mit
dem DescValue "ExportKNR=2100" markiert. Alle Buchungen im Konto 2100A
werden somit beim Export dem Konto 2100 zugeschlagen. Der Steuerberater
sieht also nur das konto "Privat Entnahmen 2100" und die "Spezialkonten"
aus unserem eigenen Kontenrahmen tauchen im Konto 2100 auf. Das Konto
2100A ist also aus Sicht des Steuerberaters "versteckt".

 

\ **Ausgabeverzeichnis, Dateiname**

Die Ausgabedatei wird in das Verzeichnis "$HOME/gnc\_csv\_export"
(hardcoded) geschrieben. Der dabei verwendete Dateiname wird aus der
Jahreszahl des zu exportierenden Geschäftsjahrs und einem Zeitstempel
gebildet, z.B.:

::

      2007_03.03.2007.csv

Eine bereits vorhandene Datei wird ohne Nachfrage überschrieben!

**Beispiel**

Die Testdatei "IBRTest.gnc" aus dem Installations-Paket öffnen und den
Menüpunkt "CSV Export" ausführen.

Inhalt der exportieren Datei  2007\_06.03.2007.csv:

::

    9500s;;3805;"10";;0603;1821;;;;;"Erloes Projekt X UST ";;;;;;;
    50000s;;4400;"10";;0603;1821;;;;;"Erloes Projekt X Netto ";;;;;;;
    25000s;;1821;"20";;0603;6500;;;;;"Sommerreifen Netto";;;;;;;
    4750s;;1821;"20";;0603;1405;;;;;"Sommerreifen Vorsteuer";;;;;;;
    100000s;;9000;"0";;0101;1821;;;;;"Eroeffnung Bank ";;;;;;;

\ **ASCII - Format beschreibung**

Die bedeutung der felder im einzelnen (beigesteuert von Uwe Klein):

::

    1    Buchungsbetrag --> Umsatz ("s" == "Soll")
    2    BU-Schlüssel, leer
    3    Gegenkonto == Habenkonto
    4    Belegfeld1 --> Belegnummer
    5    Belegfeld2, leer
    6    Belegdatum, DDMM, 2Ziffern Tag, 2Ziffern Monat
    7    Konto == Sollkonto
    8    Kostfeld 1, leer
    9    Kostfeld 2, leer
    10    Kostmenge, leer
    11    Skonto, leer
    12    Buchungstext
    13    EULand, leer
    14    EuSteuersatz, leer
    15    Währungskennung, leer
    16    Basiswährungsbetrag, leer
    17    Basiswährungskennung, leer
    18    Basiswährungskurs, leer

**Import beim Steuerberater**

Der steuerberater kann in seinem "Kanzlei - Rechnungswesen" programm die
funktion "ASCII - Daten importieren" (menüpunkt "Stapelverarbeitung" -->
"ASCII Import") verwenden um unsere buchungsdaten zu importieren.

Dabei muss er nur den dateinahmen auswählen (z.B.
A:\\2002\_06.03.2007.csv) und das buchungsjahr (datum, in unserem
beispiel 2007) eingeben.

Verwaltung von Anlagen, AFA
===========================================

Um Anlagevermögen und Abschreibungen zu Verwalten gibt es zwei
Funktionen im IBR Modul:

-  

   "AFA Buchungen Vorbereiten", mit Hilfe dieser Funktion werden die AFA
   Buchungen für die Anlagegüter berechnet und in die entsprechenden
   Konten gebucht - sofern noch nicht vorhanden.
-  

   "Anlagen Spiegel", Anzeige des Anlagespiegels für einen bestimmten
   Zeitraum. Dieser kann dann ausgedruckt und/oder im HTML Format
   exportiert werden.

Es wird nur die "lineare Abschreibung" unterstützt.

Einrichtung Kontenrahmen (siehe auch Beispieldatei IBRTest.gnc):

-  

   Anlagevermögen, z.B. "Anlagen und Maschinen Überkonto", dieses Konto
   wird als Überkonto ausgeführt, somit lässt sich die Korrektheit der
   Buchungen leicht prüfen. Dieses Konto enthält selber keine Buchungen,
   der Saldo dieses Kontos (mit Unterkonten) muss, falls korrekt
   gebucht, Null betragen.

   -  

      Anlagevermögen, z.B. "Anlagen und Maschinen 0400", auf diese Konto
      wird der Einkauf (oder die Einlage) der Anlage (ggf. abzüglich
      MwSt) gebucht.

Historie
==========

Die Versions-Historie finden Sie am Anfang der Datei
**ibr-gnc-module.scm**.

 

Download (alt, aktuelle Quellen auf github)
=============================================

 

.. raw:: html

   <p>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="field field-name-taxonomy-vocabulary-1 field-type-taxonomy-term-reference field-label-above">

.. raw:: html

   <div class="field-label">


.. raw:: html

   </div>

.. raw:: html

   <div class="field-items">

.. raw:: html

   <div class="field-item even">

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </p>

.. |Datei| image:: /modules/file/icons/application-octet-stream.png
.. |image1| image:: /modules/file/icons/application-octet-stream.png
.. |image2| image:: /modules/file/icons/application-octet-stream.png
.. |Package icon| image:: /modules/file/icons/package-x-generic.png
.. |image4| image:: /modules/file/icons/application-octet-stream.png
.. |image5| image:: /modules/file/icons/package-x-generic.png
.. |image6| image:: /modules/file/icons/application-octet-stream.png
.. |image7| image:: /modules/file/icons/package-x-generic.png

.. raw:: html

   <div class="field field-name-upload field-type-file field-label-hidden">

.. raw:: html

   <div class="field-items">

.. raw:: html

   <div class="field-item even">

.. raw:: html

   <table class="sticky-enabled">

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <thead>

.. raw:: html

   <tr>

.. raw:: html

   <th>

Anhang

.. raw:: html

   </th>

.. raw:: html

   <th>

Größe

.. raw:: html

   </th>

.. raw:: html

   </tr>

.. raw:: html

   </thead>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tbody>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="odd">

.. raw:: html

   <td>

\ |Datei| `ibr-gnc-module-1.43.tgz getestet mit GnuCash
2.3.10 </sites/default/files/ibr-gnc-module-1.43.tgz>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

27.6 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="even">

.. raw:: html

   <td>

\ |image1| `ibr-gnc-module-1.44.tgz getestet mit GnuCash 2.3.15 und
2.4.0 </sites/default/files/ibr-gnc-module-1.44.tgz>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

28.01 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="odd">

.. raw:: html

   <td>

\ |image2| `ibr-gnc-module-1.47.tgz getestet mit GnuCash 2.3.15 und
2.4.5 </sites/default/files/ibr-gnc-module-1.47.tgz>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

28.09 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="even">

.. raw:: html

   <td>

\ |Package icon| `ibr-gnc-module-1.47.zip getestet mit GnuCash 2.3.15 und 2.4.5 </sites/default/files/ibr-gnc-module-1.47.zip>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

28.71 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="odd">

.. raw:: html

   <td>

\ |image4| `ibr-gnc-module-1.49.tgz getestet mit GnuCash 2.3.15 und
2.4.5 </sites/default/files/ibr-gnc-module-1.49.tgz>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

33.98 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="even">

.. raw:: html

   <td>

\ |image5| `ibr-gnc-module-1.49.zip getestet mit GnuCash 2.3.15 und
2.4.5 </sites/default/files/ibr-gnc-module-1.49.zip>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

35.18 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="odd">

.. raw:: html

   <td>

\ |image6| `ibr-gnc-module-1.59.tgz getestet mit GnuCash
2.4.13 </sites/default/files/ibr-gnc-module-1.59.tgz>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

33.54 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   <tr class="even">

.. raw:: html

   <td>

\ |image7| `ibr-gnc-module-1.59.zip getestet mit GnuCash
2.4.13 </sites/default/files/ibr-gnc-module-1.59.zip>`_\ 

.. raw:: html

   </td>

.. raw:: html

   <td>

34.73 KB

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   </tbody>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   </table>

.. raw:: html

   </p>

.. raw:: html

   <p>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

