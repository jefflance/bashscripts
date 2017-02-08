#!/bin/bash

URXVTC=$(which urxvtcd)
WID=$(xdotool search --classname urxvtq)

if [ -z "$WID" ]; then
  $URXVTC -name urxvtq -geometry 80x28
  WID=$(xdotool search --classname urxvtq | head -1)
  xdotool windowfocus $WID
  xdotool key Meta_L+l
else
  if [ -z "$(xdotool search --onlyvisible --classname urxvtq 2>/dev/null)" ]; then
    xdotool windowmap $WID
    xdotool windowfocus $WID
  else
    xdotool windowunmap $WID
  fi
fi
