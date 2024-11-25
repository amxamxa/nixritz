#!/usr/bin/env bash

 tr -c "[:graph:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock 2>/dev/null | \
 awk '{
     line = "";
     for (i = 1; i <= length($0); i++) {
         char = substr($0, i, 1);
         if (char ~ /[^ ]/) {
             color = sprintf("\033[38;5;%dm", 16 + int(rand() * 240));  # Zufällige ANSI-Farbe
             line = line color char "\033[0m";  # Reset-Farbe
         } else {
             line = line char;
         }
     }
     print line;
 }'

