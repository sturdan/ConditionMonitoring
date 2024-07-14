# Quick-Start
Put the data from the dataset.zip in the dataset folder. <br>
[https://megastore.rz.uni-augsburg.de/get/UgurunRu0u/](https://megastore.rz.uni-augsburg.de/get/UgurunRu0u/)
<br>
[http://192.168.1.32:30034/Git_Large-Files/ConditionMonitoring/](http://192.168.1.32:30034/Git_Large-Files/ConditionMonitoring/)
<br>
        
# Fragen
    1. Wieso Tachometer Spalte immer 0?

# Aufgabenstellung

Wälzlager werden häufig verwendet und sind äußerst wichtige Komponenten in
verschiedenen Maschinen. Ihr Ausfall ist eine der Hauptursachen für
Fehlfunktionen bei rotierenden Maschinen. Die **Fehlersuche** bei Lagerproblemen
ist ein wichtiger Bestandteil jeder **Wartungsroutine**. Die **Vorhersage der
Verschlechterung von Lagern** ist entscheidend für die Gewährleistung der
Zuverlässigkeit und Wartungseffizienz rotierender Maschinen. Die
**Schwingungsüberwachung und -analyse** hat sich als nützliche Technik zur
Erkennung von Lagerausfällen erwiesen. Änderungen in den Schwingungsmustern
können frühzeitig auf mögliche Lagerausfälle hinweisen, sodass das Eingreifen
und Reparieren der Ausrüstung möglich ist, bevor sie ernsthaften Schaden
erleidet.

Ziel dieser Aufgabe ist es, den **Verschleißgrad von Lagern** mittels eines
**Anomalieüberwachungsansatzes** anhand von Betriebsdaten der Lager zu
untersuchen. **Anomalie-Mustererkennungstechniken** sollen eingesetzt werden, um
abnormales Verhalten in den Daten zu identifizieren und so frühe Anzeichen von
Verschlechterung zu erkennen. Der **Datensatz** umfasst Messungen unter
verschiedenen **Betriebsbedingungen** bei **15 unterschiedlichen Drehzahlen**
und **6 verschiedenen Drehmomentstufen** sowohl im gesunden Zustand als auch bei
**sechs bekannten Fehlerstufen**. Leiten Sie den **Trainings- und
Testdatensatz** aus dem bereitgestellten Datensatz ab. Die **Abtastrate** des
Schwingungssignals beträgt **20480 Hz**. Die **Spalten der Schwingungsdaten**
enthalten, von links nach rechts, horizontale, axiale und vertikale
Beschleunigungen sowie Signale des Tachometers in der letzten Spalte. Alle
Signale sind **zeitsynchronisiert**. Jede **.txt-Datendatei** ist mit den
entsprechenden Drehzahl- und Drehmomentwerten benannt. Beispielsweise bedeutet
**V100_200N_2.txt** eine Drehzahl von **100 U/min** der Eingangswelle mit einem
Drehmoment von **200 Nm** an der Ausgangswelle. „_2“ steht für die zweite
Wiederholung der Datenerfassung. Ein Modell sollte auf verschiedene Fehlerstufen
verallgemeinern können. Darüber hinaus führen Sie eine **Abhängigkeitsanalyse**
der **Eingangs- (Schwingung) und Ausgangsvariablen (Verschleißgrad)** durch.

## Fragen

### (1) Modellerstellung

a. **Um welche Art von Problem handelt es sich hierbei?**
   - Welche Modelle betrachten Sie basierend auf der **Problemklassifikation des
     Verschleißgrades**?
   - Begründen Sie Ihre Wahl.

b. **Datenverarbeitung**
   - i. **Datenreduktion & Merkmalsengineering:**
      - Welche **Signalmerkmale** können für Ihr **Diagnosemodell** verwendet
        werden?
      - Wie generieren Sie diese aus den bereitgestellten Daten?
   - ii. **Merkmalsranking**

c. **Führen Sie eine Abhängigkeitsanalyse** der Eingangs- und Ausgangsvariablen
durch.
   - Wählen Sie eine geeignete **grafische Darstellung**, um die Beziehung
     darzustellen.

d. **Training:**
   - Verwenden Sie die bereitgestellten Daten, um Ihre Modelle zu
     **trainieren**.

### (2) Modellevaluierung

a. **Leistungsmaß:**
   - Treffen Sie eine fundierte Aussage über die **Zuverlässigkeit Ihres
     Modells**.

b. **Testen:**
   - Verwenden Sie Ihr Modell, um die **unbeschrifteten Daten** zu analysieren
     und so den **Verschleißgrad** zu bestimmen.

### (3) Weiterentwicklung des Modells

a. **Im besten Fall** haben Sie jetzt ein **funktionales und validiertes
Modell**, das zwischen den verschiedenen **Verschleißgraden** unterscheiden
kann.

b. Wo sehen Sie **Herausforderungen oder Einschränkungen** für den Einsatz Ihres
Modells in einer **industriellen Umgebung**?

c. Welche **Ansätze** könnten Sie in Zukunft verfolgen, um das
**Überwachungssystem** weiterzuentwickeln?
   - Beschränken Sie sich nicht nur auf die Diagnose.



