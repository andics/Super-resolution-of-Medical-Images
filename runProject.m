function [finalImage] = runProject(numberOfCycles)

clc;	% Clear command window.	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;

fontsize = 16;

imageFile = 'IM00300.dcm';

imageFile = getPixels(imageFile);

imageSR = resolutionIncrease(imageFile);

subplot(2,3,3);
imshow(imageSR, []);
title('One time SR Image', 'FontSize', fontsize);
axis on;

for i=1:numberOfCycles
    
formatSpec = "Cycle number %d";
str = sprintf(formatSpec, i);
figure("Name", str);
set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(2,3,1);
imshow(imageFile, []);
title('Before new SR', 'FontSize', fontsize);
axis on;

imageSR = resolutionIncrease(imageFile);

[imageFile, denoisedImage, firstPSF, finalPSF] = imageDeconv(imageSR, 12, 8, 15);
imageFile = min(imageFile,255);

subplot(2,3,2);
imshow(imageSR, []);
title('After new SR', 'FontSize', fontsize);
axis on;


subplot(2,3,3);
imshow(imageFile, []);
title('After SR-Deblurring', 'FontSize', fontsize);
axis on;

%Noise removal
subplot(2,3,6);
imshow(denoisedImage, []);
title('After SR-Deblurring-Denoising', 'FontSize', fontsize);

subplot(2,3,5);
imshow(finalPSF, []);
title('Final used PSF', 'FontSize', fontsize);
axis on;

subplot(2,3,4);
imshow(firstPSF, []);
title('Initial PSF', 'FontSize', fontsize);
axis on;

end

finalImage = imageFile;

end

