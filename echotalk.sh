#!/bin/sh

echo "$1"
$(cat /root/text-escape/speech.prog.txt) "$1"
exit
