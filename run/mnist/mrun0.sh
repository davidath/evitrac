#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    make run test CONF=ini/mnist/real3/real3.ini CONF2=ini/mnist/real3/real3sae.ini RUN=$i PREF=real3
    make run test CONF=ini/mnist/real10/real10.ini CONF2=ini/mnist/real10/real10sae.ini RUN=$i PREF=real10
    make run test CONF=ini/mnist/rorder3/rorder3.ini CONF2=ini/mnist/rorder3/rorder3sae.ini RUN=$i PREF=rorder3
done
make run test CONF=ini/mnist/real4/real4.ini CONF2=ini/mnist/real4/real4sae.ini RUN=0 PREF=real4
