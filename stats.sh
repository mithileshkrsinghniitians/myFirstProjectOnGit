#! /bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
NETWORK=$(speedometer -l  -r enp0s3 -t enp0s3 -m $(( 1024 * 1024 * 3 / 2 )))
LOGGEDINUSER=$(who -u)
echo "$MEMORY$DISK$CPU$NETWORK$LOGGEDINUSER"
sleep 5
done
