#!/bin/bash

FILE=$1

awk -f student_grade.awk "$FILE" > temp.txt

head -n 1 temp.txt

tail -n +2 temp.txt | sort

rm temp.txt