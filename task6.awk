# David Navarrete
# Systems Engineering
# Task 6 - Student Grades

BEGIN {
    FS=","
}

NR==1 {
    next
}

{
    earned[$1] += $4
    possible[$1] += $5
}

END {
    printf "%-10s %7s %s\n", "Name", "Percent", "Letter"
    for (st in earned) {
        p = 100 * earned[st] / possible[st]
        if (p >= 90) g = "A"
        else if (p >= 80) g = "B"
        else if (p >= 70) g = "C"
        else if (p >= 60) g = "D"
        else g = "E"
        printf "%-10s %7.2f %s\n", st, p, g
    }
}