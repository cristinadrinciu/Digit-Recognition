Digit Recognition

The project receives a set of input files with handwritten digits and it predicts what digit is.

"MNIST" is a dataset of 70000 images labeled, with handwritten numbers collected from a multitude of people. The set has a part of 60000 training images and 10000 images that will be
used as a test. The images are black and white and have a size of 28x28 pixels.

The algorithm is based on Singular Values Decomposition (SVD) for compresing images, but also the compresion using principal component analysis (PCA).

Algorithm steps
are the following:

1. Preparing the data set by loading it in Octave with
load command.
2. The average of each column is calculated, and then it is subtracted from each
column element. Thus, the pixels of each image were normalized.
3. The covariance matrix is calculated using the formula
cov_matrix = X' * X / (m – 1)
4. The vectors and eigenvalues of the covariance matrix are calculated.
5. The eigenvalues are sorted in descending and preserving order
the eigenvectors are sorted in the same order.
6. The ordered eigenvectors in step 5 are used to create a
new V matrices.
7. The first k columns are selected from V. For this version a
of the algorithm k is chosen to be equal to 23.
8. The projection of X in the space of the main components: Y is calculated
= X * Vk
9. The approximation of X denoted X is calculated using only 23 de
main components: X = Y * Vk'
10. The test image is transformed into a vector of length 784 and
projects in the space of the main components by multiplying by V-
obtained in the previous steps.
11. The k-nearest neighbors algorithm is applied, for which k = 5 is chosen,
and the obtained result is the sought prediction.

To calculate the final prediction we will use the k-nearest neighbors algorithm which calculates the "closest" k images from the training set. choosing of k is a problem in itself because a too small k can lead to the wrong finding of prediction, and too large a number can lead to oversaturation of information, which again leads to wrong answers. For the recognition algorithm a k = 5 is sufficient. The k-nearest neighbors algorithm has the following steps:

1. The matrix Y is used, which represents the projection of the matrix with the data of
entry into the space of the main components. Each row of the matrix is taken
which represents the vectorized form of an image and the distance is calculated
the Euclidean between this vector and the test vector:
distance = √(𝑦1 − 𝑥1 )2 + ⋯ + (𝑦784 − 𝑥784 )

2. The obtained distances are sorted in ascending order and only the first 5 are kept
the values that represent what number was in are stored in a vector
respective picture (i.e. the first picture in the set is a 5, the second is a 0
etc.).

3. The median of the vector obtained above is calculated and thus obtained
FORECASTING.

The prepare_data function has the signature: [train_mat, train_val] =
prepare_data (name, no_train_images) and with its help you will import the data required from the "mnist.mat" file.

The visualize_image function has the signature: im = visualize_image
(train_mat, number) and with its help you can view the image with the number
number from the data set.

The function magic_with_pca has the signature: [train, miu, Y, Vk] =
magic_with_pca (train_mat, pcs) and apply PCA to the training matrix,
implementing steps 2-9 of the prediction algorithm.

The function prepare_photo has the signature: sir = prepare_photo (im) si
receives the test image which it modifies and transforms into a string for a
the prediction could be made more easily. The training images have a black background and white number, while the test ones have a white background and a black number, so it must be reverse the colors.

The KNN function has the signature: prediction = KNN (labels, Y, test, k) and puts apply the k-nearest neighbors algorithm.

The classify_image function has the signature: prediction = classifyImage (im,
train_mat, train_val, pcs) and put together the previous functions to return
the prediction he makes.
