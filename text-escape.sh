#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
CMDCFG=$WEREAMI/speakYN.txt
cd $WHEREAMI
TALK=$WHEREAMI/$(cat speakYN.txt)
echo "$WHEREAMI" > darkroom/ding.pop.txt

$TALK "welcome to furry text-escape"
$TALK "(C) 2015 Thomas Leathers"
$TALK "the world is a strange place"
$TALK "and this terminal window is not going to help"
$TALK "you are a male fox"
echo "$(cat art/opening1.txt)"
$TALK "you are locked in a dark room. you see a:"
$TALK "bunny, she asks if you need help."
$TALK "she says:"
$TALK "hello, I'm here to help!"
$TALK "type help, for instructions,"
$TALK "type about for about information"
$TALK "or type hint to hear a hint"
$TALK "type start to start the game!"
until [ "$IN1" = "start" ]
do
  until [[ "$IN1" = "help" || "$IN1" = "hint" || "$IN1" = "start"  || "$IN1" = "about" ]]
  do
  $TALK "please choose option: help, hint, start, about"
  read IN1
  done
  if [ "$IN1" = "help" ]; then
  $TALK "$(cat help.txt)"
  fi
  if [ "$IN1" = "about" ]; then
  $TALK "$(cat about.txt)"
  fi
  if [ "$IN1" = "hint" ]; then
  $TALK "type start to start the game!"
  fi
  if [[ "$IN1" = "help" || "$IN1" = "hint" || "$IN1" = "about" ]]; then
    IN1=nullvalue
  fi
done
echo "0" > darkroom/darkroom.complete.txt
DARKROOMSTAT=$(cat darkroom/darkroom.complete.txt)
darkroom/objreset.sh
darkroom/darkroom.sh
$TALK "you escaped! congrads! thanks for playing!"

$TALK "would you like to see the credits, and a message from the develpoer?"
$TALK "if so type yes, type anything else to exit."
read CREDITSYN
if [ "$CREDITSYN" = "yes" ]; then
$TALK "$(cat credits.txt)"
$TALK "press enter to exit"
read EXITNULLENTRY
fi
