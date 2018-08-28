function [clusterMatrix1, clusterMatrix2] = clusterColors(inputImage)
%cluster image regions and segnet the suture

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);

end

