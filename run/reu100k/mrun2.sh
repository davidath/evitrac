#! /bin/bash
START=$1
let END=START+3
let END2=START+1
for (( i=$START; i<=$END; i++ ));do 
     ./train.py ini/reu100k/2real/2real.ini $i ini/reu100k/2real/2realsae1.ini ini/reu100k/2real/2realsae2.ini
     make test CONF=ini/reu100k/2real/2real.ini RUN=$i PREF=2real
done
for (( i=$START; i<=$END2; i++ ));do ./train.py ini/reu100k/half/half.ini $i ini/reu100k/half/halfsae1.ini ini/reu100k/half/halfsae2.ini;done
for (( i=$START; i<=$END2; i++ ));do make test CONF=ini/reu100k/half/half.ini RUN=$i PREF=half;done

