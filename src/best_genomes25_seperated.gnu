#!/usr/bin/gnuplot
#

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
set bars 2.0
set tics scale 0.75
set xtics nomirror out ('Target' 0,'ST' 1,'IFR' 2, 'AIV' 3)
set ytics nomirror #out 0.5 

#set yrange [0:1.3]
#set xrange [-0.6:2]

# Draw line for significant test
#set arrow 1 from 0,1 to 1,1 nohead ls 5
#set arrow 2 from 0,1 to 0,0.95 nohead ls 5
#set arrow 3 from 1,1 to 1,0.95 nohead ls 5
#set label '**' at 0.5,1.05 center 

# Size of one box
bs = 0.5


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
set output "../gfx/best25b.eps"

set multiplot layout 3,1
set ylabel "{ST}" font "Helvetica,24"
set yrange [8:16]
set xrange [-0.5:3.5]
set ytics (8,10,12,14,16)
set arrow 1 from 0.5,ST25_Rand5Median to 3.5,ST25_Rand5Median nohead ls 3
set arrow 2 from 0.5,ST25_Rand1Median to 3.5,ST25_Rand1Median nohead ls 5
plot 'best25-ST.dat'  i 0 u 0:1:(bs) notitle w boxes ls 2, \
     ''  i 0 u 0:1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 1 u ($0+1):1:(bs) notitle w boxes ls 3, \
     ''  i 1 u ($0+1):1:($2*2) notitle w yerrorb ls 1
#unset key
set ylabel "{IFR}" font "Helvetica,24"
set yrange [0.22:0.26]
set ytics (0.22,0.24,0.26) #,0.28,0.3)
unset arrow 1
unset arrow 2
set arrow 3 from 0.5,IFR25_Rand5Median to 3.5,IFR25_Rand5Median nohead ls 3
set arrow 4 from 0.5,IFR25_Rand1Median to 3.5,IFR25_Rand1Median nohead ls 5
plot 'best25-IFR.dat'  i 0 u 0:1:(bs) notitle w boxes ls 2, \
     ''  i 0 u 0:1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 1 u ($0+1):1:(bs) notitle w boxes ls 3, \
     ''  i 1 u ($0+1):1:($2*2) notitle w yerrorb ls 1
set ylabel "{AIV}" font "Helvetica,24"
set yrange [0.18:0.24]
set ytics (0.18,0.2,0.22,0.24) #,0.26,0.28)
unset arrow 3
unset arrow 4
set arrow 5 from 0.5,AIV25_Rand5Median to 3.5,AIV25_Rand5Median nohead ls 3
set arrow 6 from 0.5,AIV25_Rand1Median to 3.5,AIV25_Rand1Median nohead ls 5
plot 'best25-AIV.dat'  i 0 u 0:1:(bs) notitle w boxes ls 2, \
     ''  i 0 u 0:1:($2*2) notitle  w yerrorb ls 1, \
     ''  i 1 u ($0+1):1:(bs) notitle w boxes ls 3, \
     ''  i 1 u ($0+1):1:($2*2) notitle w yerrorb ls 1 

unset multiplot

!fixbb ../gfx/best25b.eps
