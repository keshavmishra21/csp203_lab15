set title "Age vs Blood Pressure"
set xlabel "Age"
set ylabel "Blood Pressure"

set datafile separator ","
set terminal png
set output '4b.png'

set yrange [80:220]
plot "heart.csv" using 1:4 with points title "Age vs Blood Pressure" lt rgb "green" pt 7 ps 1