#!/bin/sh
#	$Id$
# Testing grdcut -S for 3 different points

ps=origin.ps

# Create global grid by evaluating distances to 0,0
grdmath -Rd -I1 0 0 SDIST = tmp.nc
grdcontour tmp.nc -JQ0/7i -P -K -A10 -C5 -Baf -Y6.5i -Xc > $ps
# Plot three origins and circles
psxy -R -J -O -K -SE << EOF >> $ps
> -W1p,red
30 30 0 3000 3000
> -W1p,green
-170 -60 0 3000 3000
> -W1p,blue
145 78 0 3000 3000
EOF
psxy -R -J -O -K -Sx0.1i -W1p << EOF >> $ps
30 30
-170 -60
145 78
EOF
# 1st point
grdcut tmp.nc -Sn30/30/1500k -Gt.nc
psbasemap -Rt.nc -JM3i -O -K -Baf -Y-4i >> $ps
grd2xyz t.nc -s | psxy -R -J -O -K -Ss0.02i -Gcyan -N >> $ps
grd2xyz t.nc -sr | psxy -R -J -O -K -Ss0.02i -Gorange -N >> $ps
grdcontour t.nc -J -O -K -A10 -C5 -Gd2i >> $ps
echo 30 30 0 3000 3000 | psxy -R -J -O -K -SE -W1p,red >> $ps
echo 30 30 | psxy -R -J -O -K -Sx0.1i -W1p >> $ps
# 2nd point [set nodes to NaN outside]
grdcut tmp.nc -Sn-170/-60/1500k -Gt.nc
psbasemap -Rt.nc -JM3i -O -K -Baf -X4i >> $ps
grd2xyz t.nc -s | psxy -R -J -O -K -Ss0.02i -Gcyan -N >> $ps
grd2xyz t.nc -sr | psxy -R -J -O -K -Ss0.02i -Gorange -N >> $ps
grdcontour t.nc -J -O -K -A10 -C5 -Gd2i >> $ps
echo -170 -60 0 3000 3000 | psxy -R -J -O -K -SE -W1p,green >> $ps
echo -170 -60 | psxy -R -J -O -K -Sx0.1i -W1p >> $ps
# 3rd point
grdcut tmp.nc -Sn145/78/1500k -Gt.nc
psbasemap -Rt.nc -JQ0/7i -O -K -Baf -X-4i -Y-1.5i >> $ps
grd2xyz t.nc -s | psxy -R -J -O -K -Ss0.02i -Gcyan -N >> $ps
grd2xyz t.nc -sr | psxy -R -J -O -K -Ss0.02i -Gorange -N >> $ps
grdcontour t.nc -J -O -K -A10 -C5 -Gd2i >> $ps
echo 145 78 0 3000 3000 | psxy -R -J -O -K -SE -W1p,blue >> $ps
echo 145 78 | psxy -R -J -O -K -Sx0.1i -W1p >> $ps

psxy -R -J -O -T >> $ps
