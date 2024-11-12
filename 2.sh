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
echo "\\begin{document}" >> $output_file

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