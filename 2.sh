#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file.csv>"
  exit 1
fi

input_file="$1"
output_file="table_output.tex"

echo "\\documentclass{article}" > $output_file
echo "\\usepackage{booktabs}" >> $output_file
echo "\\usepackage{graphicx}" >> $output_file
echo "\\usepackage{longtable}" >> $output_file
echo "\\usepackage{float}" >> $output_file
echo "\\begin{document}" >> $output_file


echo "\\begin{figure}[H]" >> $output_file
echo "\\centering" >> $output_file
echo "\\includegraphics[width=0.7\\textwidth]{4a.png}" >> $output_file
echo "\\caption{Gender vs Number}" >> $output_file
echo "\\label{fig:sample_figure1}" >> $output_file
echo "\\end{figure}" >> $output_file

echo "\\begin{figure}[H]" >> $output_file
echo "\\centering" >> $output_file
echo "\\includegraphics[width=0.7\\textwidth]{4b.png}" >> $output_file
echo "\\caption{Age vs Blood Pressure}" >> $output_file
echo "\\label{fig:sample_figure2}" >> $output_file
echo "\\end{figure}" >> $output_file

echo "\\begin{figure}[H]" >> $output_file
echo "\\centering" >> $output_file
echo "\\includegraphics[width=0.7\\textwidth]{4c.png}" >> $output_file
echo "\\caption{Age vs Cholestrol(No Heart Disease)}" >> $output_file
echo "\\label{fig:sample_figure3}" >> $output_file
echo "\\end{figure}" >> $output_file

echo "\\begin{figure}[H]" >> $output_file
echo "\\centering" >> $output_file
echo "\\includegraphics[width=0.7\\textwidth]{4d.png}" >> $output_file
echo "\\caption{Pie chart of Heart Disease}" >> $output_file
echo "\\label{fig:sample_figure4}" >> $output_file
echo "\\end{figure}" >> $output_file


echo "Figure~\\ref{fig:sample_figure1} shows Historgram for Gender vs Number of Disease. Figure~\\ref{fig:sample_figure2} shows Age vs Blood Pressure. Figure~\\ref{fig:sample_figure3} shows Age vs Cholestrol(No Heart Disease). Figure~\\ref{fig:sample_figure4} shows Pie Chart for Heart Diseases." >> $output_file


echo "\\begin{center}" >> $output_file

echo "\\begin{longtable}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}" >> $output_file
echo "\\hline" >> $output_file

header=$(head -n 1 $input_file)
echo "$header \\\\" | sed 's/,/ \& /g' >> $output_file
echo "\\hline" >> $output_file
echo "\\endfirsthead" >> $output_file

echo "\\hline" >> $output_file
echo "$header \\\\" | sed 's/,/ \& /g' >> $output_file
echo "\\hline" >> $output_file
echo "\\endhead" >> $output_file

tail -n +2 $input_file | while IFS= read -r line; do
  echo "$line \\\\" | sed 's/,/ \& /g' >> $output_file
  echo "\\hline" >> $output_file
done

echo "\\end{longtable}" >> $output_file

echo "\\end{center}" >> $output_file

echo "\\end{document}" >> $output_file