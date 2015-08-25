#!/bin/sh

CMDCFG=/root/text-escape/speakYN.txt
TALK=/root/text-escape/$(cat /root/text-escape/speakYN.txt)

FLOPPYDISK=$(cat /root/text-escape/darkroom/floppy.txt)
if [ "$FLOPPYDISK" = "1" ]; then
  IN2=doorY
  $TALK "The door opened!"
fi
