#! /bin/bash
arg=$1
sed -n 79p triple_$1/$1.ini
sed -n 81p triple_$1/$1.ini
sed -n 82p triple_$1/$1.ini
sed -n 83p triple_$1/$1.ini
sed -n 84p triple_$1/$1.ini
echo '---------------------'
sed -n 32p triple_$1/$1sae1.ini
sed -n 32p triple_$1/$1sae2.ini
sed -n 32p triple_$1/$1sae3.ini
