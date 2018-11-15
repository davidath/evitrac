#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    ./train.py ini/cifar/triple_g/g.ini $i ini/cifar/triple_g/gsae1.ini ini/cifar/triple_g/gsae2.ini ini/cifar/triple_g/gsae3.ini
    make test CONF=ini/cifar/triple_g/g.ini RUN=$i PREF=triple_g
    ./train.py ini/cifar/triple_h/h.ini $i ini/cifar/triple_h/hsae1.ini ini/cifar/triple_h/hsae2.ini ini/cifar/triple_h/hsae3.ini
    make test CONF=ini/cifar/triple_h/h.ini RUN=$i PREF=triple_h
done
