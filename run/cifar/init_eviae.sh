#! /bin/bash
make run_cmd CONF=ini/cifar/real3/real3.ini CONF2=ini/cifar/real3/real3sae.ini RUN=0 PREF=real3
make run_cmd CONF=ini/cifar/real4/real4.ini CONF2=ini/cifar/real4/real4sae.ini RUN=0 PREF=real4
make run_cmd CONF=ini/cifar/real5/real5.ini CONF2=ini/cifar/real5/real5sae.ini RUN=0 PREF=real5
make run_cmd CONF=ini/cifar/real10/real10.ini CONF2=ini/cifar/real10/real10sae.ini RUN=0 PREF=real10
make run_cmd CONF=ini/cifar/rand3/rand3.ini CONF2=ini/cifar/rand3/rand3sae.ini RUN=0 PREF=rand3
make run_cmd CONF=ini/cifar/rand5/rand5.ini CONF2=ini/cifar/rand5/rand5sae.ini RUN=0 PREF=rand5
make run_cmd CONF=ini/cifar/rand10/rand10.ini CONF2=ini/cifar/rand10/rand10sae.ini RUN=0 PREF=rand10
make run_cmd CONF=ini/cifar/rorder3/rorder3.ini CONF2=ini/cifar/rorder3/rorder3sae.ini RUN=0 PREF=rorder3
make run_cmd CONF=ini/cifar/rorder10/rorder10.ini CONF2=ini/cifar/rorder10/rorder10sae.ini RUN=0 PREF=rorder10


