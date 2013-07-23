#
# Boxplot demo
#

set terminal postscript eps enhanced size 7,5.5 defaultplex leveldefault mono solid dashlength 1.0 linewidth 2.0 butt noclip "Helvetica" 18 

set output 'boxplot25-sep.eps'


# color definitions
set border 15 linewidth 1.5
set style line 1 lc rgb 'gray30' lt 1 lw 2
set style line 2 lc rgb 'gray40' lt 1 lw 2
set style line 3 lc rgb 'gray70' lt 1 lw 2
set style line 4 lc rgb 'gray90' lt 1 lw 2
set style line 5 lc rgb 'black' lt 1 lw 2
set style line 6 lc rgb 'white' lt 1 lw 2

set style fill solid 0.5 border rgb 'grey30'

set key left top

set bars 2.0
set tics scale 0.75
set xtics nomirror out ('Target' 0,'ST' 1,'IFR' 2, 'AIV' 3)
set ytics mirror #out 0.5 

#set style fill solid 0.25 border -1
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth  0.5
set pointsize 0.5

unset key
set multiplot layout 3,1

set xtics ("Target" -0.15, "1-step" 0.65, "5-step" 1.35, "ST" 2.5, "IFR" 4, "AIV" 5.5) scale 0.0
# set xtics nomirror
# set ytics nomirror
set yrange [8:20]
set ylabel "{/Symbol=32 Y}  ST" font "Helvetica,20"
plot 'target_diffAN.dat' using (0):1, \
     'rand1diffAN.dat' using (0.75):1, \
     'rand5diffAN.dat' using (1.25):1, \
     'st_sim1.dat' using (2):1:(0.25), \
     'st_sim2.dat' using (2.25):1:(0.25), \
     'st_sim3.dat' using (2.5):1:(0.25), \
     'st_sim.dat' using (3):1, \
     'ifr_sim1.dat' using (3.5):1:(0.25), \
     'ifr_sim2.dat' using (3.75):1:(0.25), \
     'ifr_sim3.dat' using (4):1:(0.25), \
     'ifr_sim.dat' using (4.5):1, \
     'iv_sim1.dat' using (5):1:(0.25), \
     'iv_sim2.dat' using (5.25):1:(0.25), \
     'iv_sim3.dat' using (5.5):1:(0.25), \
     'iv_sim.dat' using (6):1
set ylabel "{/Symbol=32 Y}  IFR" font "Helvetica,20"
set yrange [0.22:0.28]
plot 'target_diffAN.dat' using (0):4, \
     'rand1diffAN.dat' using (0.75):4, \
     'rand5diffAN.dat' using (1.25):4, \
     'st_sim1.dat' using (2):2:(0.25), \
     'st_sim2.dat' using (2.25):2:(0.25), \
     'st_sim3.dat' using (2.5):2:(0.25), \
     'st_sim.dat' using (3):2, \
     'ifr_sim1.dat' using (3.5):2:(0.25), \
     'ifr_sim2.dat' using (3.75):2:(0.25), \
     'ifr_sim3.dat' using (4):2:(0.25), \
     'ifr_sim.dat' using (4.5):2, \
     'iv_sim1.dat' using (5):2:(0.25), \
     'iv_sim2.dat' using (5.25):2:(0.25), \
     'iv_sim3.dat' using (5.5):2:(0.25), \
     'iv_sim.dat' using (6):2

set ylabel "{/Symbol=32 Y} AIV" font "Helvetica,20"
set yrange [0.18:0.24]
set logscale y
plot 'target_diffAN.dat' using (0):6, \
     'rand1diffAN.dat' using (0.75):6, \
     'rand5diffAN.dat' using (1.25):6, \
     'st_sim1.dat' using (2):($3/6):(0.25), \
     'st_sim2.dat' using (2.25):($3/6):(0.25), \
     'st_sim3.dat' using (2.5):($3/6):(0.25), \
     'st_sim.dat' using (3):($3/6), \
     'ifr_sim1.dat' using (3.5):($3/6):(0.25), \
     'ifr_sim2.dat' using (3.75):($3/6):(0.25), \
     'ifr_sim3.dat' using (4):($3/6):(0.25), \
     'ifr_sim.dat' using (4.5):($3/6), \
     'iv_sim1.dat' using (5):($3/6):(0.25), \
     'iv_sim2.dat' using (5.25):($3/6):(0.25), \
     'iv_sim3.dat' using (5.5):($3/6):(0.25), \
     'iv_sim.dat' using (6):($3/6)


unset multiplot

!fixbb boxplot-sep.eps
