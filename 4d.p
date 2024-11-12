set terminal png size 800,600
set output '4d.png'
set title "Heart Disease by Age Group"
set key out top box
set style fill solid 1.0 border -1
set angles degree
set size square
# Define starting angle
start_angle = 0
reg1 = 36
reg2 = reg1 + 61.2
reg3 = reg2 + 97.2
reg4 = reg3 + 108
reg5 = reg4 + 46.8
reg6 = reg5 + 10.8
colors = "red, orange, yellow, green, blue, purple"
set obj 1 circle arc [0:reg1] fc rgb "red"
set obj 2 circle arc [reg1:reg2] fc rgb "orange"
set obj 3 circle arc [reg2:reg3] fc rgb "yellow"
set obj 4 circle arc [reg3:reg4] fc rgb "green"
set obj 5 circle arc [reg4:reg5] fc rgb "blue"
set obj 6 circle arc [reg5:reg6] fc rgb "purple"
set obj 1 circle at 0,0 size 1 front
set obj 2 circle at 0,0 size 1 front
set obj 3 circle at 0,0 size 1 front
set obj 4 circle at 0,0 size 1 front
set obj 5 circle at 0,0 size 1 front
set obj 6 circle at 0,0 size 1 front
set xrange [-1:1]
set yrange [-1:1]
plot NaN title "40-49" with lines lc "red",      NaN title "50-59" with lines lc "orange",      NaN title "60-69" with lines lc "yellow",      NaN title "70-79" with lines lc "green",      NaN title "80-89" with lines lc "blue",      NaN title "90+" with lines lc "purple"
