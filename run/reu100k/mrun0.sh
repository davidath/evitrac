#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    make run test CONF=ini/reu100k/real4/real4.ini CONF2=ini/reu100k/real4/real4sae.ini RUN=$i PREF=real4
    make run test CONF=ini/reu100k/real10/real10.ini CONF2=ini/reu100k/real10/real10sae.ini RUN=$i PREF=real10
    make run test CONF=ini/reu100k/rorder4/rorder4.ini CONF2=ini/reu100k/rorder4/rorder4sae.ini RUN=$i PREF=rorder4
done
make run test CONF=ini/reu100k/real5/real5.ini CONF2=ini/reu100k/real5/real5sae.ini RUN=0 PREF=real5
