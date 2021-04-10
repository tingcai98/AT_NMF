# Adversarially-Trained Nonnegative Matrix Factorization
Adversarially-Trained nonnegative matrix factorization (AT-NMF) is a new method for matrix completion in NMF. AT-NMF introduces an adversary attacker during the training process and thus increases the prediction ability of the NMF model.

Our code contains the normalized datasets and the AT-NMF algorithm. It is written in Jupyter notebook and Pytorch, which runs on GPU.

The normalization steps can be found in our paper. For each dataset, we generate 7 binary masks having the same dimension as the original matrix. The binary mask is generated as each entry has alpha chance to be removed (alpha = 0.3,0.4, .., 0.8, 0.9). The 1s in the binary mask denote training entries and 0s denote testing entries.


# Download Dataset
1. CBCL Dataset
We use the MIT CBCL Face Dataset, which is used in Lee and Seung (1999). The dataset contains 2429 frontal-view facial images. Each image has 19*19 pixels. The dataset can be downloaded at http://www.ai.mit.edu/projects/cbcl/software-datasets/FaceData2.html

2. Hyperspectral Dataset
We use two hyperspectral datasets: Moffet and Madonna, which are used in Févotte and Dobigeon (2015). We adopt the normalization method in the paper as well. The two datasets have 165 and 160 spectral bands respectively. The size of each image is 50*50 pixels. The datasets can be downloaded at Moffet: http://aviris.jpl.nasa.gov/html/ aviris.freedata.html. Madonna: See reference Sheeren et al. (2011)


# Reference
Daniel D Lee and H Sebastian Seung. Learning the parts of objects by non-negative matrix factorization. Nature, 401(6755):788–791, 1999.

Cédric Févotte and Nicolas Dobigeon. Nonlinear hyperspectral unmixing with robust nonnegative matrix factorization. IEEE Transactions on Image Processing, 24(12):4810–4819, Dec 2015.

David Sheeren, Mathieu Fauvel, Sylvie Ladet, Anne Jacquin, Georges Bertoni, and Annick Gibon. Mapping ash tree colonization in an agricultural mountain landscape: Investigating the potential of hyperspectral imagery. In Proc. IEEE Int. Conf. Geosci. Remote Sens. (IGARSS), Vancouver, Canada, pages 3672–3675, July 2011.
