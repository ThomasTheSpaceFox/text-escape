#!/bin/sh

echo "$1"
$(cat speech.prog.txt) "$1"
exit
