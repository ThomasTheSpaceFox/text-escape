#!/bin/sh
TERM="$(cat /root/text-escape/terminal.config.txt)"
$TERM --title "Furry Text-Escape" -e /root/text-escape/text-escape.sh