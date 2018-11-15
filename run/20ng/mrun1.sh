#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    make run test CONF=ini/20ng/rand3/rand3.ini CONF2=ini/20ng/rand3/rand3sae.ini RUN=$i PREF=rand3
    make run test CONF=ini/20ng/rand10/rand10.ini CONF2=ini/20ng/rand10/rand10sae.ini RUN=$i PREF=rand10
    make run test CONF=ini/20ng/rorder20/rorder20.ini CONF2=ini/20ng/rorder20/rorder20sae.ini RUN=$i PREF=rorder20
done
