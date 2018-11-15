#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    make run test CONF=ini/20ng/real5/real5.ini CONF2=ini/20ng/real5/real5sae.ini RUN=$i PREF=real5
    make run test CONF=ini/20ng/real20/real20.ini CONF2=ini/20ng/real20/real20sae.ini RUN=$i PREF=real20
    make run test CONF=ini/20ng/rorder5/rorder5.ini CONF2=ini/20ng/rorder5/rorder5sae.ini RUN=$i PREF=rorder5
done
make run test CONF=ini/20ng/real6/real6.ini CONF2=ini/20ng/real6/real6sae.ini RUN=0 PREF=real6
