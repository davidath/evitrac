#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    make run test CONF=ini/reu100k/rand3/rand3.ini CONF2=ini/reu100k/rand3/rand3sae.ini RUN=$i PREF=rand3
    make run test CONF=ini/reu100k/rand10/rand10.ini CONF2=ini/reu100k/rand10/rand10sae.ini RUN=$i PREF=rand10
    make run test CONF=ini/reu100k/rorder10/rorder10.ini CONF2=ini/reu100k/rorder10/rorder10sae.ini RUN=$i PREF=rorder10
done
