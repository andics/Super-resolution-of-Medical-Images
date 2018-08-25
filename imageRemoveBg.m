function [finalImage] = imageRemoveBg(imageFile)
%FFunction for segmenting the bone from the background
%{
level = graythresh(imageFile);

indices = find(abs(imageFile)<level);
imageFile(indices) = 0;

finalImage = imageFile;
%}

mask = zeros(size(imageFile));
mask(25:end-25,25:end-25) = 1;

bw = activecontour(imageFile,mask,300);

bw = removeSpots(bw);

finalImage = bw;

end

