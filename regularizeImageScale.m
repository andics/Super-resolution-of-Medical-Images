function [outputImage] = regularizeImageScale(inputImage)
%Convert pixel values in the range of 0-1

outputImage = double(inputImage/255);

end

