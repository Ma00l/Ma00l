@ECHO OFF
REM setlocal EnableDelayedExpansion
REM chcp 65001
CHCP 1250
CLS

REM  ISC License Copyright ^(c^) 2018^, cnleo
REM  https://github.com/cnleo/nvidia-telemetry-remove
REM  https://choosealicense.com/licenses/isc/

REM  LESEN:
ECHO(
ECHO  Umlaute: AE ^= �^, OE ^= �^, UE ^= �^, SS ^= �
ECHO  Wenn sie keine Umlaute erkennen^,
ECHO  aendern sie bitte die Schrift zu Lucida Console.
ECHO  Am oberen Fensterrand druecken Sie:
ECHO  Rechtsklick --^> Eigenschaften --^> Schrift
ECHO(
ECHO  Dieses Script ist ausschlie�lich f�r Windows 7 ^(getestet^)
ECHO  und Vista ^(nicht getestet^).
ECHO(
ECHO  Dieses Script muss als Administrator ausgef�hrt werden^,
ECHO  damit die HOSTS-Datei editiert werden kann.
ECHO  Anstelle eines Doppelklicks auf diese Datei:
ECHO  Rechtsklick --^> Als Administrator ausf�hren...

ECHO(
PAUSE
CLS
ECHO(

REM  LESEN:
ECHO(
ECHO  Es werden jetzt drei Tasks deaktiviert.
ECHO  Die Ausgabe sollte jeweils eine der folgenden sein:
ECHO  FEHLER: Der angegebene Aufgabenname xyz ist auf dem System nicht vorhanden.
ECHO  Oder ERFOLGREICH: Die Parameter der geplanten Aufgabe xyz wurden ge�ndert. 
  
ECHO(
PAUSE
CLS
ECHO(

ECHO  STATUS:
ECHO(
ECHO  Task NvTmMon wird deaktiviert^, sofern vorhanden ...
schtasks /change /TN NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /disable
ECHO  ... fertig.
ECHO(
ECHO  Task NvTmRep wird deaktiviert^, sofern vorhanden ...
schtasks /change /TN NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /disable
ECHO  ... fertig.
ECHO(
ECHO  Task NvTmRepOnLogon wird deaktiviert^, sofern vorhanden ...
schtasks /change /TN NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8} /disable
ECHO  ... fertig.

ECHO(
PAUSE 
CLS
ECHO(

REM  LESEN:
ECHO(
ECHO  Es wird nun der Telemetrie Dienst Deinstalliert.
ECHO  Dazu er�ffnet sich ein Fenster von Nvidia^, 
ECHO  es sei denn es ist bereits Deinstalliert.
ECHO  Um anschlie�end hier fortzufahren m�ssen sie ggf. das Nvidia Fenster
ECHO  nach der Deinstallation des Telemetrie Containers Schlie�en.

ECHO(
PAUSE
CLS
ECHO(

ECHO  STATUS:
ECHO(
ECHO  Um hier fortfahren zu k�nnen muss das Nvidia Fenster geschlossen werden^, 
ECHO  sofern der Telemetrie-Container noch nicht Deinstalliert wurde ...
rundll32 "%PROGRAMFILES%\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage NvTelemetryContainer
ECHO  ... fertig.

ECHO(
PAUSE
CLS
ECHO(

REM  LESEN:
ECHO(
ECHO  Zu guter Letzt werden in der HOSTS Datei noch die 
ECHO  Telemetrie-Server-Adressen zum blocken hinzugef�gt.
ECHO  Zun�chst sollten sie aber pr�fen^, ob bereits ein Nvidia Eintrag existiert.
ECHO  Wenn ja sind sie fertig und k�nnen dieses Fenster einfach schlie�en.
ECHO  Andernfalls schlie�en Sie bitte Notepad mit der Hosts Datei wieder^, 
ECHO  die sich automatisch f�r sie �ffnete und fahren hier fort.
notepad "%SystemRoot%\system32\drivers\etc\hosts"

ECHO(
PAUSE
CLS
ECHO(

ECHO  STATUS:
ECHO  ...
ECHO(>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO # nVidia Telemetry begin>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO 127.0.0.1 gfwsl.geforce.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO 127.0.0.1 gfe.geforce.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO 127.0.0.1 telemetry.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO 127.0.0.1 gfe.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO 127.0.0.1 telemetry.gfe.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO 127.0.0.1 events.gfe.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO ::1 gfwsl.geforce.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO ::1 gfe.geforce.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO ::1 telemetry.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO ::1 gfe.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO ::1 telemetry.gfe.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO ::1 events.gfe.nvidia.com>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO # nVidia Telemetry end>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO(>>"%SystemRoot%\system32\drivers\etc\hosts"
ECHO  ... fertig.

ECHO(
PAUSE
CLS
ECHO(

REM  LESEN:
ECHO(
ECHO  Sie sind fertig und k�nnen dieses Fenster einfach schlie�en oder 
ECHO  ein letztes weiteres Mal eine beliebige Taste dr�cken.



ECHO(

ECHO  MEHR INFOS:
ECHO(
REM  https://en.wikibooks.org/wiki/Windows_Programming/Programming_CMD
REM  https://en.wikipedia.org/wiki/Hosts_(file)
REM  http://www.robvanderwoude.com/schtasks.php
REM  https://ss64.com/nt/echo.html
REM  http://www.robvanderwoude.com/escapechars.php
ECHO  http://extreme.pcgameshardware.de/grafikkarten/458638-anleitung-nvidia-telemetrie-deaktivieren.html
ECHO(
ECHO  ANDERE TOOLS:
ECHO(
ECHO  https://github.com/NateShoffner/Disable-Nvidia-Telemetry

ECHO(

REM Keep window open with pause

PAUSE

@ECHO ON
