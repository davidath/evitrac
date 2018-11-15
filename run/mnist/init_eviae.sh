#! /bin/bash
make run_cmd CONF=ini/mnist/real3/real3.ini CONF2=ini/mnist/real3/real3sae.ini RUN=0 PREF=real3
make run_cmd CONF=ini/mnist/real10/real10.ini CONF2=ini/mnist/real10/real10sae.ini RUN=0 PREF=real10
make run_cmd CONF=ini/mnist/rorder3/rorder3.ini CONF2=ini/mnist/rorder3/rorder3sae.ini RUN=0 PREF=rorder3
make run_cmd CONF=ini/mnist/rand3/rand3.ini CONF2=ini/mnist/rand3/rand3sae.ini RUN=0 PREF=rand3
make run_cmd CONF=ini/mnist/rand10/rand10.ini CONF2=ini/mnist/rand10/rand10sae.ini RUN=0 PREF=rand10
make run_cmd CONF=ini/mnist/rorder10/rorder10.ini CONF2=ini/mnist/rorder10/rorder10sae.ini RUN=0 PREF=rorder10
make run_cmd CONF=ini/mnist/real4/real4.ini CONF2=ini/mnist/real4/real4sae.ini RUN=0 PREF=real4

