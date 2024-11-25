#!/usr/bin/env bash

tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock 2>/dev/null | \
awk -v delay=0.01 'BEGIN {
    srand();  # Initialisiert den Zufallszahlengenerator basierend auf der aktuellen Zeit
}
{
    line = "";  # Temporärer String zur Konstruktion der Ausgabe
    for (i = 1; i <= length($0); i++) {
        char = substr($0, i, 1);  # Extrahiert das aktuelle Zeichen
        if (char ~ /[^ ]/) {  # Prüft, ob das Zeichen kein Leerzeichen ist
            # Definiert die Unicode-Bereiche und wählt zufällig einen Bereich aus
            ranges[1] = "0x1F600,0x1F64F";  # Emoticons
            ranges[2] = "0x2600,0x26FF";    # Verschiedene Symbole
            ranges[3] = "0x1F680,0x1F6FF";  # Transport und Karte
            ranges[4] = "0x1F300,0x1F5FF";  # Ornamentale Dingbats
            ranges[5] = "0x1F900,0x1F9FF";  # Menschen und Körper
            ranges[6] = "0x1F980,0x1F9FF";  # Aktivitäten
            ranges[7] = "0x1F4F0,0x1F5FF";  # Objekte und Bürobedarf
            
            # Wählt zufällig einen Bereich aus
            selected_range = ranges[int(rand() * length(ranges)) + 1];
            split(selected_range, bounds, ",");
            lower = strtonum(bounds[1]);  # Untere Grenze des Bereichs
            upper = strtonum(bounds[2]);  # Obere Grenze des Bereichs
            
            # Generiert ein zufälliges Unicode-Zeichen innerhalb des Bereichs
            unicode = sprintf("%c", lower + int(rand() * (upper - lower + 1)));
            
            # Zufällige Farbe für das Zeichen
            color = sprintf("\033[38;5;%dm", 16 + int(rand() * 240));  # ANSI 256-Farbpalette
            
            # Fügt das farbige Unicode-Zeichen zur Zeile hinzu
            line = line color unicode "\033[0m";  # "\033[0m" setzt die Farbe zurück
            
            # Verzögerung zwischen der Ausgabe von Zeichen
            system("sleep " delay);
        } else {
            line = line char;  # Leerzeichen bleiben unverändert
        }
    }
    print line;  # Gibt die vollständig verarbeitete Zeile aus
}'
