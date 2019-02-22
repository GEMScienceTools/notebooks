#!/usr/bin/env bash

CPT='/tmp/tmp.cpt'
EXTENT=$(gmt info -I.5 -D $1)

gmt set MAP_FRAME_TYPE = PLAIN
gmt set MAP_GRID_CROSS_SIZE_PRIMARY = 0.2i
gmt set MAP_FRAME_TYPE = PLAIN
gmt set FONT_TITLE = 16p
gmt set FONT_LABEL = 12p

gmt makecpt -Cjet -T5/9/0.1 > $CPT

gmt psbasemap $EXTENT -Jm$3c -K -B1/1WSne > $2
gmt psxy $1 -R -J -O -K -C$CPT -W0.3 >> $2
gmt pscoast -R -J -N1 -O -W1 -Dh >> $2
gmt psconvert $2 -Tg -P -A
rm gmt.*
