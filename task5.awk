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

    printf "%-10s %-10s %-10s %-10s\n",
    "Name","Low","High","Average"

    for(assignment in sum) {

        average=sum[assignment]/count[assignment]

        printf "%-10s %-10d %-10d %-10.2f\n",
        assignment,
        min[assignment],
        max[assignment],
        average
    }
}