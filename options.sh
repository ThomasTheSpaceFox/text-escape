#!/bin/sh

export DIALOG='
<window title="configure Furry Text-escape" image-name="/root/text-escape/FTE_48.png">
  <vbox>
    <text>
      <label>"terminal emulator to use"</label>
    </text>
    <entry>
      <variable>TERM</variable>
      <input file>/root/text-escape/terminal.config.txt</input>
    </entry>
    <text>
      <label>"speech program to use."</label>
    </text>
    <entry>
      <variable>SPEECHPROG</variable>
      <input file>/root/text-escape/speech.prog.txt</input>
    </entry>
    <button>
      <label>enable Text To Speech</label>
      <action>"echo echotalk.sh > /root/text-escape/speakYN.txt"</action>
    </button>
    <button>
      <label>disable Text To Speech</label>
      <action>"echo echonull.sh > /root/text-escape/speakYN.txt"</action>
    </button>
    <hbox>
      <button ok></button>
      <button cancel></button>
    </hbox>
  </vbox>
</window>'
I=$IFS; IFS=""
for STATEMENTS in  $(gtkdialog --program DIALOG); do
  eval $STATEMENTS
done
IFS=$I

if [ "$EXIT" = "OK" ]; then
  echo "$TERM" > /root/text-escape/terminal.config.txt
  echo "$SPEECHPROG" > /root/text-escape/speech.prog.txt
else
  echo ""
fi