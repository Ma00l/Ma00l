# Nvidia Telemetrie Entfernen

Ein kleines Batchscript um die Telemetrie von Nvidia abzuschalten bzw. etwas einzudämmen. 
Es folgt zum Teil den Anweisungen, wie sie bei http://extreme.pcgameshardware.de/grafikkarten/458638-anleitung-nvidia-telemetrie-deaktivieren.html aufgezeigt wurden (siehe auch Programmablauf).

Das Script ist nur für Windows 7 (getestet) und Vista (nicht getestet) sowohl 32 Bit als auch 64 Bit.
Es sollte als Administrator ausgeführt werden um die Hosts-Datei editieren zu können.

Das Script führt durch die einzelnen Schritte.


## Alternative und Ergänzende Tools

Es gibt ein Tool das etwas mehr Komfort bieten und wohl auch für neuere Betriebssysteme funktioniert. Es fehlen allerdings die Ergänzungen in der Hosts-Datei:
https://github.com/NateShoffner/Disable-Nvidia-Telemetry

## Programmablauf


### Deaktiviert 3 Einträge im Taskmanager | der Aufgabenplanung

* NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}
* NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}
* NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}

### Aufruf der Deinstallationsroutine von Nvidia zum deinstallieren des NvTelemetryContainer

rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer


### Hosts-Datei Einträge Ergänzungen

127.0.0.1 gfwsl.geforce.com  
127.0.0.1 gfe.geforce.com  
127.0.0.1 telemetry.nvidia.com  
127.0.0.1 gfe.nvidia.com  
127.0.0.1 telemetry.gfe.nvidia.com  
127.0.0.1 events.gfe.nvidia.com  
::1 gfwsl.geforce.com  
::1 gfe.geforce.com  
::1 telemetry.nvidia.com  
::1 gfe.nvidia.com  
::1 telemetry.gfe.nvidia.com  
::1 events.gfe.nvidia.com  


## Allgemein

Auch hier sei noch mal gesagt. Installieren Sie die Nvidia Treiber nicht via Express und wählen Sie alles bis auf die Grafik-Treiber selber ab bzw. je nach persönlicher Präferenz weitere dazu.

Führen Sie nach jedem erneuten Installieren von Nvidia Treiber dieses Script aus. Sie können sich allerdings dann den Part der Bearbeitung der Hosts-Datei sparen. Zumindest unter Windows 7 ist mir nicht bekannt, dass die Hosts-Datei durch Windows Updates resettet wird.
