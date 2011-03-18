#
# Boxplot demo
#
set term post enh font "Helvetica" 18
set output '../gfx/iv-boxplot.eps'
set style fill solid 0.25 border -1
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth  0.5
set pointsize 0.5

unset key
set border 2
set xtics ("Target" 0, "Rand1" 0.7, "Rand5" 1.3, "ST" 3, "IFR" 4, "AIV" 5) scale 0.0
set xtics nomirror
set ytics nomirror
set yrange [0.16:0.24]
set ylabel "AIV Score" font "Helvetica,20"
plot 'target_diffAN.dat' using (0):6, \
     'rand1diffAN.dat' using (0.75):6, \
     'rand5diffAN.dat' using (1.25):6, \
     'st_sim.dat' using (3):($3/6), \
     'ifr_sim.dat' using (4):($3/6), \
     'iv_sim.dat' using (5):($3/6)

# 'target_diffAN_100.dat' using (2):1, \
# 'rand1diffAN_100.dat' using (2.75):1,\
# 'rand5diffAN_100.dat' using (3.25):1, \


!fixbb ../gfx/iv-boxplot.eps
