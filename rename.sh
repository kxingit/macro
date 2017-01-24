#!/bin/bash
for i in `seq ${1} ${2}`; do
#    echo $i
    printf "%s%08d%s.segd" "Renaming " ${i%}
    echo ''
    mv `printf %08d%s.segd ${i%}` `printf %08d%s.dnp ${i%}`
#    mv $i `printf %04d.%s.segd ${a%} ${a##*.}`
done
