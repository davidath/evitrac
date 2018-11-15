#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    ./train.py ini/cifar/triple_e/e.ini $i ini/cifar/triple_e/esae1.ini ini/cifar/triple_e/esae2.ini ini/cifar/triple_e/esae3.ini
    make test CONF=ini/cifar/triple_e/e.ini RUN=$i PREF=triple_e
    ./train.py ini/cifar/triple_f/f.ini $i ini/cifar/triple_f/fsae1.ini ini/cifar/triple_f/fsae2.ini ini/cifar/triple_f/fsae3.ini
    make test CONF=ini/cifar/triple_f/f.ini RUN=$i PREF=triple_f
done
