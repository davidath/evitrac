#! /usr/bin/env python

import numpy as np
import matplotlib
matplotlib.use('agg')
import matplotlib.pyplot as plt
import sys
from sklearn.preprocessing import maxabs_scale

def plot_grid(images, x, y, img_x, img_y, CMAP=plt.cm.binary, out=None, border=2):
    images = (i for i in images)
    width = border * (x + 1) + x * img_x
    height = border * (y + 1) + y * img_y

    res = np.zeros([height, width])  # the resulting image

    for curr_x in range(x):
        x_offset = (curr_x + 1) * border + (curr_x * img_x)
        for curr_y in range(y):
            y_offset = (curr_y + 1) * border + (curr_y * img_y)
            # print x_offset, y_offset
            try:
                res[x_offset:x_offset + img_x, y_offset:y_offset + img_y] = images.next().reshape(img_x, img_y)
            except StopIteration:
                pass
    fig = plt.figure()
    plt.imshow(res, cmap=CMAP)
    plt.axis('off')
    if out:
        fig.savefig(out, dpi=1000)
    else:
        plt.show()

# npy reconstruction file
px = np.load(sys.argv[1])

# output file name
out = sys.argv[2]

print 'Loaded dataset...'

# Train only
#  row1 = [210, 30, 274, 87]
#  row2 = [40, 89, 96]
#  row3 = [5, 11, 31]

row1 = [49, 89, 79, 19]
row2 = [13, 4, 5]
row3 = [10, 9, 61]

tmp = []
for i in row1:
    tmp.append(px[i])
for i in row2:
    tmp.append(px[i])
tmp.append(np.zeros(px.shape[1]))
for i in row3:
    tmp.append(px[i])
tmp.append(np.zeros(px.shape[1]))
tmp = np.array(tmp)

plot_grid(1-maxabs_scale(tmp), 4, 4, 28, 28, out=out, border=9)
