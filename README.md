# Movement-Planning-Classification
Implemented classification algorithm via naïve Bayes classifier to classify data related to movement planning 

The sim_data.mat file has a single variable named
trial, which is a structure of dimensions (20 data points) × (3 classes). The nth data
point for the kth class is a two-dimensional vector trial(n,k).x, where n = 1, . . . , 20
and k = 1, 2, 3.
To make the simulated data as realistic as possible, the data are non-negative integers, 
so one can think of them as spike counts. With this analogy, there are D = 2 neurons
and K = 3 stimulus conditions.

The naïve Bayes algorithm is implemented via 3
different class distributions: Gaussian with shared covariance, 
Gaussian with class-specific covariance, and Poisson. 
Each type of class distribution has its own file with the matlab (.m) code and a pdf showing the code with accompanying visuals. 
