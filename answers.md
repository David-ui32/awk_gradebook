## Task  1

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

## Task  2

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

## Task  3

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

## Task  4

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

## Task  5

Command:
```bash
awk -f assignment_report.awk Lab03-data.csv
```

Result:
```text
Name   Low  High  Average
Q06      8    20   14.71
L05     17    50   38.21
WS       2     5    4.21
L06     27    50   40.07
Q07     12    20   15.36
L07     21    50   38.43
H01     46   100   82.71
H02     55   100   77.57
H03     62   100   82.43
H04     32    97   72.93
H05     51   100   74.00
H06     37    98   74.21
H07     40   100   72.93
Q01      9    20   14.29
L01     27    50   40.21
Q02      9    20   14.86
L02     23    50   39.21
Q03      8    20   15.07
L03     19    50   36.57
Q04     13    20   16.43
FINAL  116   200  156.86
Q05      8    18   15.07
L04     25    50   40.36
```

Explanation:
The AWK script uses associative arrays indexed by assignment name. For each assignment it tracks the minimum score, maximum score, total score, and number of submissions. In the `END` block it calculates and prints the low score, high score, and average score for every assignment.

## Task  6

Command:
```bash
awk -f student_grade.awk Lab03-data.csv
```

Result:
```text
Name       Percent Letter
Tomas        82.22 B
Diana        62.08 D
Andrew       73.69 C
Lucia        89.53 B
Kenji        86.45 B
Chelsey      62.65 D
Eliza        84.16 B
Shane        93.12 A
Noah         63.08 D
Ava          81.43 B
Maria        79.57 C
Priya        71.04 C
Jackson      78.64 C
Sam          72.90 C
```

Explanation:
The script accumulates earned points and maximum possible points for each student using associative arrays. It calculates the overall percentage as total earned points divided by total possible points multiplied by 100. A letter grade is assigned using an if/else chain.

## Task  7

Command:
```bash
./run.sh Lab03-data.csv
```

Result:
```text
Name       Percent Letter
Andrew       73.69 C
Ava          81.43 B
Chelsey      62.65 D
Diana        62.08 D
Eliza        84.16 B
Jackson      78.64 C
Kenji        86.45 B
Lucia        89.53 B
Maria        79.57 C
Noah         63.08 D
Priya        71.04 C
Sam          72.90 C
Shane        93.12 A
Tomas        82.22 B
```

Explanation:
The Bash script receives the CSV filename as an argument, executes the Task 6 AWK script, preserves the header row, and sorts the remaining student records alphabetically by name before printing the final report.