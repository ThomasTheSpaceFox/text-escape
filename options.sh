#!/bin/sh
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
export DIALOG='
<window title="configure Furry Text-escape" image-name="FTE_48.png">
  <vbox>
    <text>
      <label>"terminal emulator to use"</label>
    </text>
    <entry>
      <variable>TERM</variable>
      <input file>terminal.config.txt</input>
    </entry>
    <text>
      <label>"speech program to use."</label>
    </text>
    <entry>
      <variable>SPEECHPROG</variable>
      <input file>speech.prog.txt</input>
    </entry>
    <button>
      <label>enable Text To Speech</label>
      <action>"echo echotalk.sh > speakYN.txt"</action>
    </button>
    <button>
      <label>disable Text To Speech</label>
      <action>"echo echonull.sh > speakYN.txt"</action>
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
  echo "$TERM" > terminal.config.txt
  echo "$SPEECHPROG" > speech.prog.txt
else
  echo ""
fi