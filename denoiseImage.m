function [outputImage] = denoiseImage(inputImage, sigma)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

outputImage = PDHGMp(inputImage, 0.2, 0.5, sigma);

end

