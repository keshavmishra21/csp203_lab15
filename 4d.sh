#!/bin/bash

input_file="heart.csv"
output_file="heart_disease_analysis.csv"
plot_script="4d.p"

awk -F, 'NR > 1 {
    age=$1
    heart_disease=$9
    if (heart_disease == 1) {
        if (age >= 40 && age < 50) age_group="40-49";
        else if (age >= 50 && age < 60) age_group="50-59";
        else if (age >= 60 && age < 70) age_group="60-69";
        else if (age >= 70 && age < 80) age_group="70-79";
        else if (age >= 80 && age < 90) age_group="80-89";
        else if (age >= 90) age_group="90+";
        print age_group;
    }
}' $input_file | sort | uniq -c | awk '{print $2 "," $1}' > $output_file

awk 'BEGIN {
    total = 0;
    while ((getline line < "'$output_file'") > 0) {
        split(line, fields, ",");
        total += fields[2];
    }
    close("'$output_file'");
    print "Age Group,Count,Percentage";
    while ((getline line < "'$output_file'") > 0) {
        split(line, fields, ",");
        percentage = fields[2] / total * 100;
        printf("%s,%.0f,%.2f%%\n", fields[1], fields[2], percentage);
    }
}' > temp.csv && mv temp.csv $output_file

cat << EOF > $plot_script
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
plot NaN title "40-49" with lines lc "red", \
     NaN title "50-59" with lines lc "orange", \
     NaN title "60-69" with lines lc "yellow", \
     NaN title "70-79" with lines lc "green", \
     NaN title "80-89" with lines lc "blue", \
     NaN title "90+" with lines lc "purple"
EOF

gnuplot $plot_script