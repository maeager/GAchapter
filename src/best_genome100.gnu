#!/usr/bin/gnuplot --persist
#
#
# AUTHOR: Michael Eager

reset

# wxt
#set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'statistics.png'
# svg
#set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
#fsize '10'
#set output 'statistics.svg'

#set terminal postscript eps enhanced defaultplex leveldefault color solid dashlength 1.0 linewidth 2.0 butt noclip palfuncparam 2000,0.003  "Helvetica" 18 
# set output "DS_ClickRecovery_result.eps"


# color definitions
set border linewidth 1.5
set style line 1 lc rgb 'gray30' lt 1 lw 2
set style line 2 lc rgb 'gray40' lt 1 lw 2
set style line 3 lc rgb 'gray70' lt 1 lw 2
set style line 4 lc rgb 'gray90' lt 1 lw 2
set style line 5 lc rgb 'black' lt 1 lw 2
set style line 6 lc rgb 'white' lt 1 lw 2
set style fill solid 1.0 border rgb 'grey30'



set key left top
set border 3
# Size of one box
bs = 0.3
set tics scale 0.75
set xtics nomirror out ('Target' 0,'ST-25   ' 1-bs/2, '   ST-100' 1+bs/2, 'IFR-25    ' 2-bs/2, '    IFR-100' 2+bs/2, 'AIV-25    ' 3-bs/2, '    AIV-100' 3+bs/2)
set ytics nomirror #out 0.5 
#errorbar cross tick
set bars 2.0

#set yrange [0:1.3]
#set xrange [-0.6:2]

# Draw line for significant test
#set arrow 1 from 0,1 to 1,1 nohead ls 5
#set arrow 2 from 0,1 to 0,0.95 nohead ls 5
#set arrow 3 from 1,1 to 1,0.95 nohead ls 5
#set label '**' at 0.5,1.05 center 

ST25_Rand1Median=`awk '{if(NR==3){print $1}}' stat_rand1_25.dat`
ST25_Rand5Median=`awk '{if(NR==3){print $1}}' stat_rand5_25.dat`
ST100_Rand1Median=`awk '{if(NR==3){print $1}}' stat_rand1_100.dat`
ST100_Rand5Median=`awk '{if(NR==3){print $1}}' stat_rand5_100.dat`


IFR25_Rand1Median=`awk '{if(NR==3){print $4}}' stat_rand1_25.dat`
IFR25_Rand5Median=`awk '{if(NR==3){print $4}}' stat_rand5_25.dat`
IFR100_Rand1Median=`awk '{if(NR==3){print $3}}' stat_rand1_100.dat`
IFR100_Rand5Median=`awk '{if(NR==3){print $3}}' stat_rand5_100.dat`

AIV25_Rand1Median=`awk '{if(NR==3){print $6}}' stat_rand1_25.dat`
AIV25_Rand5Median=`awk '{if(NR==3){print $6}}' stat_rand5_25.dat`
AIV100_Rand1Median=`awk '{if(NR==3){print $5}}' stat_rand1_100.dat`
AIV100_Rand5Median=`awk '{if(NR==3){print $5}}' stat_rand5_100.dat`

set terminal postscript eps enhanced defaultplex leveldefault color solid dashlength 1.0 linewidth 2.0 butt noclip "Helvetica" 18 
set output "../gfx/best25+100.eps"

set multiplot layout 3,1
unset logscale y
set ylabel "{ST Score}" font "Helvetica,24"
set yrange [6:16]
set xrange [-0.5:3.5]
set ytics nomirror (6,8,10,12,14,16)
set arrow 1 from 0.5,ST25_Rand5Median to 3.5,ST25_Rand5Median nohead ls 4
set arrow 2 from 0.5,ST25_Rand1Median to 3.5,ST25_Rand1Median nohead ls 5
set arrow 3 from 0.5,ST100_Rand5Median to 3.5,ST100_Rand5Median nohead ls 4
set arrow 4 from 0.5,ST100_Rand1Median to 3.5,ST100_Rand1Median nohead ls 5

plot 'best_genomes_100.dat'  i 0 u 0:1:(bs) notitle w boxes ls 2, \
     ''  i 0 u 0:1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 1 u ($0+1-bs/2):1:(bs) t '25 reps' w boxes ls 3, \
     ''  i 1 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1,\
     ''  i 2 u ($0+1+bs/2):1:(bs) notitle w boxes ls 3, \
     ''  i 2 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 3 u ($0):1:(bs) notitle w boxes ls 6, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) t '100 reps' w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1
     #unset key
set ylabel "{IFR Score}"  font "Helvetica,24"
set logscale y
set yrange [0.1:0.3] # [0.2:0.26]
set ytics nomirror  (0.1,0.15,0.2,0.25)
set arrow 1 from 0.5,IFR25_Rand5Median to 3.5,IFR25_Rand5Median nohead ls 4
set arrow 2 from 0.5,IFR25_Rand1Median to 3.5,IFR25_Rand1Median nohead ls 5
set arrow 3 from 0.5,IFR100_Rand5Median to 3.5,IFR100_Rand5Median nohead ls 4
set arrow 4 from 0.5,IFR100_Rand1Median to 3.5,IFR100_Rand1Median nohead ls 5
plot 'best100-IFR.dat'  i 0 u 0:1:(bs) notitle w boxes ls 2, \
     ''  i 0 u 0:1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 1 u ($0+1-bs/2):1:(bs) notitle w boxes ls 3, \
     ''  i 1 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1,\
     ''  i 2 u ($0+1+bs/2):1:(bs) notitle w boxes ls 3, \
     ''  i 2 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 3 u ($0):1:(bs) notitle w boxes ls 6, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1

set ylabel "{AIV Score}"  font "Helvetica,24"
set yrange [0.01:0.23]
set logscale y
set ytics nomirror  (0.01,0.02,0.05,0.1,0.2)
set arrow 1 from 0.5,AIV25_Rand5Median to 3.5,AIV25_Rand5Median nohead ls 4
set arrow 2 from 0.5,AIV25_Rand1Median to 3.5,AIV25_Rand1Median nohead ls 5
set arrow 3 from 0.5,AIV100_Rand5Median to 3.5,AIV100_Rand5Median nohead ls 4
set arrow 4 from 0.5,AIV100_Rand1Median to 3.5,AIV100_Rand1Median nohead ls 5

plot 'best100-AIV.dat'  i 0 u 0:1:(bs) notitle w boxes ls 2, \
     ''  i 0 u 0:1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 1 u ($0+1-bs/2):1:(bs) notitle w boxes ls 3, \
     ''  i 1 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1,\
     ''  i 2 u ($0+1+bs/2):1:(bs) notitle w boxes ls 3, \
     ''  i 2 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 3 u ($0):1:(bs) notitle w boxes ls 6, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1
unset multiplot


set output "../gfx/best100.eps"
unset arrow 1
unset arrow 2
unset arrow 3
unset arrow 4
set multiplot layout 3,1
unset logscale y
set ylabel "{ST}"
set yrange [6:14]
set xrange [-0.5:3.5]
set ytics (6,10,14)
set arrow 3 from 0.5,ST100_Rand5Median to 3.5,ST100_Rand5Median nohead ls 4
set arrow 4 from 0.5,ST100_Rand1Median to 3.5,ST100_Rand1Median nohead ls 5
plot 'best_genomes_100.dat'  i 3 u ($0):1:(bs) notitle w boxes ls 2, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1
     #unset key
set ylabel "{IFR}"
#set logscale y
set yrange [0.1:0.2] # [0.2:0.26]
set ytics (0.1,0.15,0.2)
set arrow 3 from 0.5,IFR100_Rand5Median to 3.5,IFR100_Rand5Median nohead ls 4
set arrow 4 from 0.5,IFR100_Rand1Median to 3.5,IFR100_Rand1Median nohead ls 5
plot 'best100-IFR.dat'  i 3 u ($0):1:(bs) notitle w boxes ls 2, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1

     set ylabel "{AIV}"
set yrange [0.02:0.04]
unset logscale y
set ytics nomirror (0.02,0.03,0.04)

set arrow 3 from 0.5,AIV100_Rand5Median to 3.5,AIV100_Rand5Median nohead ls 4
set arrow 4 from 0.5,AIV100_Rand1Median to 3.5,AIV100_Rand1Median nohead ls 5
plot 'best100-AIV.dat'  i 3 u ($0):1:(bs) notitle w boxes ls 2, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1
unset multiplot


set output "../gfx/best100b.eps"

set multiplot layout 3,1
unset logscale y
set ylabel "{ST}"
set yrange [6:14]
set xrange [-0.5:3.5]
set ytics (6,10,14)
set arrow 3 from 0.5,ST100_Rand5Median to 3.5,ST100_Rand5Median nohead ls 3
set arrow 4 from 0.5,ST100_Rand1Median to 3.5,ST100_Rand1Median nohead ls 5
plot 'best_genomes_100.dat'  i 3 u ($0):1:(bs) notitle w boxes ls 2, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1
     #unset key
set ylabel "{IFR}"
#set logscale y
set yrange [0.1:0.2] # [0.2:0.26]
set ytics (0.1,0.15,0.2)
set arrow 3 from 0.5,IFR100_Rand5Median to 3.5,IFR100_Rand5Median nohead ls 3
set arrow 4 from 0.5,IFR100_Rand1Median to 3.5,IFR100_Rand1Median nohead ls 5
plot 'best100-IFR.dat'  i 3 u ($0):1:(bs) notitle w boxes ls 2, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1

     set ylabel "{AIV}"
set yrange [0.02:0.04]
unset logscale y
set ytics nomirror (0.02,0.03,0.04)
set arrow 3 from 0.5,AIV100_Rand5Median to 3.5,AIV100_Rand5Median nohead ls 3
set arrow 4 from 0.5,AIV100_Rand1Median to 3.5,AIV100_Rand1Median nohead ls 5
plot 'best100-AIV.dat'  i 3 u ($0):1:(bs) notitle w boxes ls 2, \
     ''  i 3 u ($0):1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 4 u ($0+1-bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 4 u ($0+1-bs/2):1:($2*2) notitle w yerrorb ls 1, \
     ''  i 5 u ($0+1+bs/2):1:(bs) notitle w boxes ls 4, \
     ''  i 5 u ($0+1+bs/2):1:($2*2) notitle w yerrorb ls 1
unset multiplot

# !fixbb ../gfx/best25+100.eps
# !fixbb ../gfx/best100b.eps
