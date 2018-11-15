#! /bin/bash
START=$1
let END=START+3
START2=2
END2=3
for (( i=$START; i<=$END; i++ ));do 
     ./train.py ini/reu100k/2rand/2rand.ini $i ini/reu100k/2rand/2randsae1.ini ini/reu100k/2rand/2randsae2.ini
     make test CONF=ini/reu100k/2rand/2rand.ini RUN=$i PREF=2rand
done
for (( i=$START2; i<=$END2; i++ ));do ./train.py ini/reu100k/half/half.ini $i ini/reu100k/half/halfsae1.ini ini/reu100k/half/halfsae2.ini;done
for (( i=$START2; i<=$END2; i++ ));do make test CONF=ini/reu100k/half/half.ini RUN=$i PREF=half;done

