#!/bin/bash
FILE="$HOME/.backlight_value"

[[ -f "$FILE" ]] || echo "1" > $FILE

CURRENT=$(cat "$FILE")
NEW=$(($CURRENT + $1))

if [[ $NEW -ge 10 ]]; then
	echo 10 > $FILE
	NEW="1.0"
elif [[ $NEW -le 0 ]]; then
	echo 0 > $FILE
	NEW="0.0"
else
	echo $NEW > $FILE
	NEW="0.$NEW"
fi

xrandr --output $(xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $NEW

