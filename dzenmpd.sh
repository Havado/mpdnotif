#! /bin/sh

position(){
pos=$(mpc | awk 'NR==2' | awk '{print $4}' | sed 's/(//' | sed 's/%)//')
bar=$(echo $pos | gdbar -w 190 -h 1.5 -fg "#482866" -bg "#2C2C2C")
echo -n "$bar"
return
}

font="tewi 1c-8"
icon="/home/havado/.icons/xbm8x8"

while :; do
echo "   $(mpc current -f %artist%)
   $(mpc current -f %title%) 
   $(mpc current -f %album%)

^p(65)^ca(1,mpc prev)^i($icon/prev.xbm)^ca()   ^ca(1,mpc toggle)^i($icon/play.xbm)^ca()   ^ca(1,mpc stop)^i($icon/stop.xbm)^ca()   ^ca(1,mpc next)^i($icon/next.xbm)^ca()
$(position)" 
done | dzen2 -p -y 30 -x 1700 -l 5 -u -w 190 -ta l -fn "$font" -e 'onstart=uncollapse;key_Escape=ungrabkeys,exit'
