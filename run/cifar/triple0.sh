#! /bin/bash
START=$1
let END=START+3
for (( i=$START; i<=$END; i++ ));do 
    ./train.py ini/cifar/triple_a/a.ini $i ini/cifar/triple_a/asae1.ini ini/cifar/triple_a/asae2.ini ini/cifar/triple_a/asae3.ini
    make test CONF=ini/cifar/triple_a/a.ini RUN=$i PREF=triple_a
    ./train.py ini/cifar/triple_b/b.ini $i ini/cifar/triple_b/bsae1.ini ini/cifar/triple_b/bsae2.ini ini/cifar/triple_b/bsae3.ini
    make test CONF=ini/cifar/triple_b/b.ini RUN=$i PREF=triple_b
done
