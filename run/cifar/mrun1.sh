#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    make run test CONF=ini/cifar/rand3/rand3.ini CONF2=ini/cifar/rand3/rand3sae.ini RUN=$i PREF=rand3
    make run test CONF=ini/cifar/rand10/rand10.ini CONF2=ini/cifar/rand10/rand10sae.ini RUN=$i PREF=rand10
    make run test CONF=ini/cifar/rorder10/rorder10.ini CONF2=ini/cifar/rorder10/rorder10sae.ini RUN=$i PREF=rorder10
done
make run test CONF=ini/cifar/real5/real5.ini CONF2=ini/cifar/real5/real5sae.ini RUN=0 PREF=real5
make run test CONF=ini/cifar/rand5/rand5.ini CONF2=ini/cifar/rand5/rand5sae.ini RUN=0 PREF=rand5
