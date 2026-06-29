# David Navarrete
# Systems Engineering
# Task 5 - Per Assignment Report

BEGIN {
    FS=","
}

NR==1 {
    next
}

{
    assignment=$3

    sum[assignment]+=$4
    count[assignment]++

    if(!(assignment in min) || $4 < min[assignment])
        min[assignment]=$4

    if(!(assignment in max) || $4 > max[assignment])
        max[assignment]=$4
}

END {
    printf "%-8s %5s %5s %9s\n", "Name", "Low", "High", "Average"
    for (a in s) {
        printf "%-8s %5d %5d %9.2f\n", a, lo[a], hi[a], s[a]/n[a]
    }
}