#! /usr/bin/env python

import matplotlib
matplotlib.use('agg')
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import sys
import os
import numpy as np
sys.path.append('../../../')
import itertools
from sklearn.cluster import KMeans
from sklearn import svm
from sklearn.decomposition import PCA
from sklearn.manifold import TSNE

DATA = '../../../mkdata/CIFAR10_vgg.npz'
CIFAR_STR_LABELS = ['airplane', 'automobile', 'bird', 'cat', 'deer', 'dog',
                    'frog', 'horse', 'ship', 'truck']
LAT = np.load(sys.argv[1])


def plot_class_space(z, labels, lst, out=None, method='kmeans', reduction='PCA'):
    # Reduce to 2d samples
    if reduction == 'PCA':
        z = PCA(n_components=2).fit_transform(z)
    else:
        if os.path.exists(sys.argv[1].split('.npy')[0]+'_tsne.npy'):
            print 'Using pretrained tSNE: '+sys.argv[1].split('.npy')[0]+'_tsne.npy .....'
            z = np.load(sys.argv[1].split('.npy')[0]+'_tsne.npy')
        else:
            z = TSNE(n_components=2, verbose=2).fit_transform(z)
            np.save(sys.argv[1].split('.npy')[0]+'_tsne.npy', z)
    # Scatter
    mark = ['x','_']

    # Get indices of defined clusters
    cluster_idx = []
    for pos, l in enumerate(lst):
        ix = np.where(labels == int(l))
        cluster_idx.append(list(ix[0]))
    cluster_idx = list(itertools.chain.from_iterable(cluster_idx))
    cluster_idx = np.array(cluster_idx)

    # Slice dataset and labels
    z = z[cluster_idx,:]
    labels = labels[cluster_idx]

    #########################################################################
    # Start of plotting linear separation
    #########################################################################
    if method == 'kmeans':
        # Step size of the mesh.
        h = .02  
        km = KMeans(init='k-means++', n_clusters=len(lst), n_init=100, n_jobs=-1)
        km.fit(z)
        # Plot the decision boundary. For that, we will assign a color to each
        x_min, x_max = z[:, 0].min() - 1, z[:, 0].max() + 1
        y_min, y_max = z[:, 1].min() - 1, z[:, 1].max() + 1
        xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
        # Obtain labels for each point in mesh. Use last trained model.
        Z = km.predict(np.c_[xx.ravel(), yy.ravel()])
        # Put the result into a color plot
        Z = Z.reshape(xx.shape)
        fig = plt.figure(figsize=(5,4))
        plt.clf()
        plt.contour(Z, 
                   extent=(xx.min(), xx.max(), yy.min(), yy.max()),
                   cmap=plt.cm.binary,
                   origin='lower')
    else:
        # Step size of the mesh.
        h = .02    
        clf = svm.LinearSVC()
        clf.fit(z, labels)
        x_min, x_max = z[:, 0].min() - .5, z[:, 0].max() + .5
        y_min, y_max = z[:, 1].min() - .5, z[:, 1].max() + .5
        xx, yy = np.meshgrid(np.arange(x_min, x_max, h),
                             np.arange(y_min, y_max, h))
        Z = clf.decision_function(np.c_[xx.ravel(), yy.ravel()])
        Z = Z.reshape(xx.shape)
        fig = plt.figure(figsize=(5,4))
        plt.clf()
        plt.contour(xx, yy, Z , levels=[.5], cmap="Greys", vmin=0, vmax=.6)

    # Cluster scatter
    for pos, l in enumerate(lst):
        ix = np.where(labels == int(l))
        plt.scatter(z[ix, 0], z[ix, 1], label=CIFAR_STR_LABELS[int(l)], marker=mark[pos])
    plt.legend(loc='lower center', bbox_to_anchor=(0.5, 1.0),
          ncol=2, fancybox=True, shadow=False)
    if out:
        fig.savefig(out + ".pdf", dpi=1000)
    else:
        plt.show()


import utils
if DATA == '':
    dset = utils.load_mnist(val_size=0)
else:
    dset = utils.load_data(DATA)

lset1 = dset.train.labels
lset2 = dset.test.labels
lset = np.concatenate((lset1, lset2))
perm = np.load('CIFAR_perm.npy')
lset = lset[perm]


plot_class_space(LAT, lset, lst=sys.argv[2].split(','), out=sys.argv[3],
        method='svc', reduction='tSNE')
 
