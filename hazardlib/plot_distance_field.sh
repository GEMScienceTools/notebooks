#!/usr/bin/env bash

# $1 - File with the rupture
# $2 - File with the mesh of sites
# $3 - Figure file name
# $4 - Size of the map


CPT='/tmp/tmp.cpt'
GRD='/tmp/tmp.grd'
EXTENT=$(gmt info -I.5 -D $2)

gmt set MAP_FRAME_TYPE = PLAIN
gmt set MAP_GRID_CROSS_SIZE_PRIMARY = 0.2i
gmt set MAP_FRAME_TYPE = PLAIN
gmt set FONT_TITLE = 12p
gmt set FONT_LABEL = 10p

gmt surface $2 $EXTENT -I.1m -G$GRD -T0.1 
gmt grd2cpt $GRD -Cjet -E > $CPT

gmt psbasemap $EXTENT -Jm$4c -K -B1/1WSne > $3
gmt grdimage $GRD -R -J -K -O -C$CPT >> $3
gmt psxy $1 -R -J -O -K -C$CPT -W0.3 >> $3
gmt psscale -R -J -O -K -DJMR -C$CPT >> $3
gmt pscoast -R -J -N1 -O -W1 -Dh >> $3

gmt psconvert $3 -Tg -P -A
rm gmt.*
