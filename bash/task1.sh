#! /usr/bin/env bash


YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)
HOUR=$(date +%I)
PM_OR_AM=$(date +%p)


mkdir -p ~/Reports/$YEAR

for i in {1..12};
do
        mkdir ~/Reports/$YEAR/$i
done

if [ ! -e ~/Reprots/$YEAR/$MONTH/$DAY.xls ]
        then
               touch ~/Reports/$YEAR/$MONTH/$DAY.xls
        fi

mkdir ~/Backups

if [ $HOUR -lt 5 ] || [ $HOUR -eq 12 ] && [ "$PM_OR_AM" == "AM" ]
then
        cp  ~/Reports/$YEAR/$MONTH/$DAY.xls ~/Backups/"$YEAR-$MONTH-$DAY.xls"
else
        echo "Backup Failed"
fi
