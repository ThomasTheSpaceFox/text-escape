#!/bin/bash
WHEREAMI2="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI2
cd $(cat ding.pop.txt)
echo "0" > darkroom/toothbrush.txt
echo "0" > darkroom/floppy.txt
