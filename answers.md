## Task 1

Command:
```bash
awk -F',' 'NR>1{count++} END{print count}' Lab03-data.csv
```

Result:
```text
322
```

Explanation:
The script skips the header row using `NR>1`, counts every submission in the file, and prints the total number of submissions in the `END` block.

## Task 2

Command:
```bash
awk -F',' 'NR>1{seen[$1]=1} END{for(s in seen) count++; print count}' Lab03-data.csv
```

Result:
```text
14
```

Explanation:
The script uses an associative array named `seen` to store each student name as a unique key. Since duplicate keys are not counted more than once, the `END` block counts the total number of different students.

## Task 3

Command:
```bash
awk -F',' 'NR>1 && $3=="FINAL"{printf "%-10s %3d\n",$1,$4}' Lab03-data.csv
```

Result:
```text
Jackson    169
Kenji      162
Shane      193
Noah       116
Lucia      200
Priya      159
Andrew     123
Diana      152
Maria      152
Eliza      141
Tomas      163
Sam        152
Ava        172
Chelsey    142
```

Explanation:
The script skips the header row and selects only records where the assignment name (`$3`) is `FINAL`. It then prints the student name (`$1`) and the final exam score (`$4`) using `printf` to align the output columns.

## Task 4

Command:
```bash
awk -F',' 'NR>1 && $4 < ($5*0.60){count++} END{print count}' Lab03-data.csv
```

Result:
```text
50
```

Explanation:
The script compares each score (`$4`) with 60% of the maximum possible score (`$5`). If the score is below 60%, the submission is considered failing and counted. The `END` block prints the total number of failing submissions.

## Task 5
Command: awk -f task5.awk Lab03-data.csv 

Result: Name Low High Average FINAL 116 200 156.86 H01 46 100 82.71 H02 55 100 77.57 H03 62 100 82.43 H04 32 97 72.93 H05 51 100 74.00 H06 37 98 74.21 H07 40 100 72.93 L01 27 50 40.21 L02 23 50 39.21 L03 19 50 36.57 L04 25 50 40.36 L05 17 50 38.21 L06 27 50 40.07 L07 21 50 38.43 Q01 9 20 14.29 Q02 9 20 14.86 Q03 8 20 15.07 Q04 13 20 16.43 Q05 8 18 15.07 Q06 8 20 14.71 Q07 12 20 15.36 WS 2 5 4.21 

Explanation: The script stores sums, counts, minimums, and maximums inside associative arrays indexed by the assignment name ($3). In the END block, it loops through all tasks, computes the statistical average, and uses printf to output the formatted columns.

## Task 6
Command: awk -f task6.awk Lab03-data.csv 

Result: Student Percentage Grade Andrew 73.69 C Ava 81.43 B Chelsey 62.65 D Diana 62.08 D Eliza 84.16 B Jackson 78.64 C Kenji 86.45 B Lucia 89.53 B Maria 79.57 C Noah 63.08 D Priya 71.04 C Sam 72.90 C Shane 93.12 A Tomas 82.22 B 

Explanation: The script accumulates the total earned points and total possible points for each student using two associative arrays indexed by student name ($1). At the end, it calculates the dynamic final percentage and determines the letter grade using an if-else structure.

## Task 7
Command: ./run.sh Lab03-data.csv 

Result: Student Percentage Grade Andrew 73.69 C Ava 81.43 B Chelsey 62.65 D Diana 62.08 D Eliza 84.16 B Jackson 78.64 C Kenji 86.45 B Lucia 89.53 B Maria 79.57 C Noah 63.08 D Priya 71.04 C Sam 72.90 C Shane 93.12 A Tomas 82.22 B 

Explanation: The Bash script reads the input file passed as an argument, extracts and displays the header row independently using head, and then processes the remaining body records through tail and the Unix sort tool to organize students alphabetically.