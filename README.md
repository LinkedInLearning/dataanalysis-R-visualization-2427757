# Datenanalyse mit R: Visualisierung
Dies ist das Repository für den **LinkedIn Learning** Kurs `Datenanalyse mit R: Visualisierung`. Den gesamten Kurs finden Sie auf [LinkedIn Learning][lil-course-url].

![image](https://user-images.githubusercontent.com/61017085/178548825-48c59056-e80b-4768-ae62-a34fd90528c2.png) 

In unserem digitalen Zeitalter fallen Unmengen an Daten an ... ein regelrechter Datenschatz, der jedoch erst einen Wert bekommt, wenn wir daraus nützliche Informationen ziehen können. Die Statistiksprache R ist dafür ein mächtiges Werkzeug. Sie bietet eine umfangreiche Bibliothek an Paketen, die das Importieren, Aufbereiten und Analysieren von Daten vereinfacht. In diesem LinkedIn Learning Kurs zeigt Ihnen die Trainerin Stefanie Lösch, wie Daten visuell mit R analysiert werden können.  
 
Die Trainerin Stefanie Lösch gibt Ihnen einen Einblick in die verschiedenen Farben und Farbpaletten von R. Sie erfahren, wie Sie eine Vielfalt an Grafiken und Diagrammtypen auf unterschiedliche Weise erstellen können. Dazu gehören Säulendiagramme und Histogramme, sowie Boxplots, Streudiagramme, aber auch Dendrogramme zur Analyse von Gruppenstrukturen in Datensätzen. 

## Anleitung
Dieses Repository hat Branches für jedes Video im Kurs. Verwenden Sie das Ausklappmenü "Branch: ..." in GitHub um zwischen den unterschiedlichen Branches hin und her zu wechseln bzw. um bei einem spezifischen Status einzusteigen. Oder Sie fügen `/tree/BRANCH_NAME` der URL hinzu um direkt in den gewünschten Branch zu wechseln.

## Branches
Die Git Branches sind passend zu den Videos im Kurs strukturiert. Die Namenskonvention lautet `Kapitel#_Video#`. Der Branch `02_03` beinhaltet zum Beispiel die Übungen für das dritte Video im zweiten Kapitel. 
Einige Branches haben einen Anfangsstatus (`b`) für "beginning" und einen Endstatus (`e`). Der Branch mit dem `e` am Ende beinhaltet in diesem Fall stets den Code der am Ende des Videos zu sehen ist. Der `master` Branch beinhaltet den initialen Quellcode und wird nicht für die Übungen innerhalb des Kurses genutzt.

Wenn Sie von einem Branch nach Änderungen zum nächsten Branch wechseln, erhalten Sie möglicherweise die folgende Meldung:

```
error: Your local changes to the following files would be overwritten by checkout:        [files]
Please commit your changes or stash them before you switch branches.
Aborting
```

Dieses Problem lösen Sie wie folgt:
    Add changes to git using this command: git add .
    Commit changes using this command: git commit -m "some message"

## Installation

1. Um diese Übungsdateien nutzen zu können, müssen Sie folgendes installiert haben:
   - aktuelle R - Version (und ggf. rtools): siehe https://cran.r-project.org/  
   - aktuelle RStudio - Version (kostenlose Desktopversion genügt): https://www.rstudio.com/products/rstudio/download/
2. Laden Sie die Dateien als zip-Paket herunter oder klonen Sie das Repository in Ihre lokale Maschine unter Verwendung von terminal (Mac), CMD (Windows) oder ein anderes Werkzeug mit grafischer Bedienoberfläche wie SourceTree.
3. Entzippen Sie ggf. die Datei und öffnen Sie anschließend die R - Projektdatei mit Endung .Rproj

### Autor

**Stefanie Lösch**

_Datenanalystin, Trainerin, Dr. rer. pol._

Sehen Sie sich andere Kurse des Autors auf [LinkedIn Learning](https://www.linkedin.com/learning/instructors/dr-stefanie-losch) an.

[lil-course-url]: https://www.linkedin.com/learning/datenanalyse-mit-r-datenvisualisierung
