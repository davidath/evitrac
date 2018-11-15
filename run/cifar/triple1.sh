#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    ./train.py ini/cifar/triple_c/c.ini $i ini/cifar/triple_c/csae1.ini ini/cifar/triple_c/csae2.ini ini/cifar/triple_c/csae3.ini
    make test CONF=ini/cifar/triple_c/c.ini RUN=$i PREF=triple_c
    ./train.py ini/cifar/triple_d/d.ini $i ini/cifar/triple_d/dsae1.ini ini/cifar/triple_d/dsae2.ini ini/cifar/triple_d/dsae3.ini
    make test CONF=ini/cifar/triple_d/d.ini RUN=$i PREF=triple_d
done
