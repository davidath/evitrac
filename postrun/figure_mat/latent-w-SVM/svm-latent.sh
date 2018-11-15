#! /bin/bash
python svm-latent.py real3_px_hidden_full.npy $1,$2 init_lat$1$2 && python svm-latent.py COND_real3_px_hidden_full.npy $1,$2 evitram_lat$1$2
