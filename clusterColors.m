function [clusterMatrix1, clusterMatrix2] = clusterColors(inputImage)
%cluster image regions and segnet the suture

clusteredImage = cluster(2, inputImage(:,:));

clusterMatrix1 = clusteredImage(1,:);
clusteredMatrix2 = clusteredImage(2,:);

end

