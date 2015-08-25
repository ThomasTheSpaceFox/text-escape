#!/bin/sh
WHEREAMI2="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI2
cd $(cat ding.pop.txt)
CMDCFG=$(dirs)/speakYN.txt
TALK=$(dirs)/$(cat speakYN.txt)

echo "$(cat art/darkroom1.txt)"
$TALK "you see a:"
$TALK "sink"
$TALK "door"
$TALK "box"
$TALK "the room is dark and cold"
$TALK "you try to open the door but it apears to need" 
$TALK "some kind of disk-key, judging by the disk drive"
$TALK "you swish your tail, facepaw yourself, and ask yourself:"
$TALK "how do i get in these situations?"


until [ "$IN2" = "doorY" ]
do
  until [[ "$IN2" = "help" || "$IN2" = "hint" || "$IN2" = "door"  || "$IN2" = "sink"  ||  "$IN2" = "box" ]]
  do
  $TALK "please choose option: help, hint, door, sink, box"
  read IN2
  done
  if [ "$IN2" = "help" ]; then
  $TALK "$(cat help.txt)"
  fi
  if [ "$IN2" = "sink" ]; then
    $TALK "you see an unopened toothbrush"
    until  [[ "$IN2B" = "yes"  ||  "$IN2B" = "no" ]]
    do
      $TALK "you say: should I take it? type yes or no"
      read IN2B
    done
    if [ "$IN2B" = "yes" ]; then
    echo "1" > darkroom/toothbrush.txt
    $TALK "you took the toothbrush"
    else
    $TALK "you leave the toothbrush there"
    IN2B=nullvalue
    fi
  fi
  if [ "$IN2" = "hint" ]; then
    $TALK "the box has a old skeleton key lock"
    $TALK "I bet that a good lock pick could unlock it!"
    $TALK "but what to use?"
    $TALK "and how are we going to open that locked door"
  fi
  if [ "$IN2" = "box" ]; then
    if [ "$(cat darkroom/toothbrush.txt)" = "1" ]; then
      $TALK "You pick the box's lock with the toothbrush" 
      $TALK "you see a floppy disk inside the box"
      until  [[ "$IN2C" = "yes"  ||  "$IN2C" = "no" ]]
      do
        $TALK "you say: should I take it? type yes or no"
        read IN2C
      done
      if [ "$IN2C" = "yes" ]; then
        echo "1" > darkroom/floppy.txt
        $TALK "you took the floppy disk"
      else
        $TALK "you leave the floppy disk there"
        IN2C=nullvalue
      fi
    else
    $TALK "it's locked!"
    fi
  fi
  if [ "$IN2" = "door" ]; then
    if [ "$(cat darkroom/floppy.txt)" = "1" ]; then
      IN2=doorY
      $TALK "The door opened!"
    else
      $TALK "the door is locked by some kind of disk drive."
    fi  
  fi
  if [[ "$IN2" = "help"  ||  "$IN2" = "hint"  ||  "$IN2" = "sink"  ||  "$IN2" = "box"  ||  "$IN2" = "door" ]]; then
    IN2=nullvalue
  fi
done
echo "1" > darkroom/darkroom.complete.txt
