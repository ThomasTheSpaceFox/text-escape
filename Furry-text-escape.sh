#!/bin/sh
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
TERM="$(cat terminal.config.txt)"
$TERM --title "Furry Text-Escape" -e $(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)/text-escape.sh