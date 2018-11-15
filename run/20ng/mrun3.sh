#! /bin/bash
START=$1
let END=START+3
START2=2
END2=3
for (( i=$START; i<=$END; i++ ));do 
     ./train.py ini/20ng/2rand/2rand.ini $i ini/20ng/2rand/2randsae1.ini ini/20ng/2rand/2randsae2.ini
     make test CONF=ini/20ng/2rand/2rand.ini RUN=$i PREF=2rand
done
for (( i=$START2; i<=$END2; i++ ));do ./train.py ini/20ng/half/half.ini $i ini/20ng/half/halfsae1.ini ini/20ng/half/halfsae2.ini;done
for (( i=$START2; i<=$END2; i++ ));do make test CONF=ini/20ng/half/half.ini RUN=$i PREF=half;done

