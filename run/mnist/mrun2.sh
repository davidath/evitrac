#! /bin/bash
START=$1
let END=START+3
let END2=START+1
for (( i=$START; i<=$END; i++ ));do 
     ./train.py ini/mnist/2real/2real.ini $i ini/mnist/2real/2realsae1.ini ini/mnist/2real/2realsae2.ini
     make test CONF=ini/mnist/2real/2real.ini RUN=$i PREF=2real
done
for (( i=$START; i<=$END2; i++ ));do ./train.py ini/mnist/half/half.ini $i ini/mnist/half/halfsae1.ini ini/mnist/half/halfsae2.ini;done
for (( i=$START; i<=$END2; i++ ));do make test CONF=ini/mnist/half/half.ini RUN=$i PREF=half;done

