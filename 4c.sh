#!/bin/bash
 
FILE=$1
 
if [[ ! -f "$FILE" ]]; then
    echo "File not found!"
    exit 1
fi

FILE1="age_cholesterol.dat"
> "$FILE1" 

while IFS=, read -r age sex chestpain bloodpressure cholesterol bloodsugar maxheartrate heartdisease; do
    
    if [[ "$age" == "Age" ]]; then
        continue
    fi

    
    if [[ "$heartdisease" == "0" && "$cholesterol" =~ ^[0-9]+$ ]]; then
        echo "$age $cholesterol" >> "$FILE1"
    fi
done < "$FILE"

gnuplot <<- EOF

set title "Age vs Cholesterol (But No Heart Disease)"
set xlabel "Age"
set ylabel "Cholesterol"
set terminal png
set output '4c.png'
set xrange [30:80]
plot '$FILE1' using 1:2 with linespoints lc "blue" pt 7 ps 1.5 title 'Age vs Cholesterol'
EOF