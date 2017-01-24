#!/bin/bash
for line in `cat line_list`
    do 
    i=$((i+1))
    icable=`echo $line |awk -F _ '{print $2}'|grep -o '[0-9]*'`
    igun=`echo $line |awk -F _ '{print $3}'|grep -o '[0-9]*'`
#    isailline=`echo $line | cut -c 1-15`
    isailline=`echo $line | awk -F _ '{print $1}'`
    printf $i' sailLine='$isailline' cable='$icable' gun='$igun' line='$line'\n'
done
