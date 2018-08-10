function [finalImage] = runCD(numberOfCycles, imageFile)
%Run Chaikin + Deblurring + Denoising at each iteration

clc;	% Clear command window.	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;

fontsize = 16;

%imageFile = 'IM00300.dcm';

sizePSF = 12;
SDPSF = 8;
degSim = 15;

sigma = 0.006;

%imageFile = getPixels(imageFile);

imageSR = resolutionIncrease(imageFile);

subplot(2,3,3);
imshow(imageSR, []);
title('One time SR Image', 'FontSize', fontsize);
axis on;

for i=1:numberOfCycles
    
formatSpec = "Cycle number %d (Chaikin + Deblurring)";
str = sprintf(formatSpec, i);
figure("Name", str);
set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(2,4,1);
imshow(imageFile, []);
title('Before new SR', 'FontSize', fontsize);
axis on;

imageSR = resolutionIncrease(imageFile);

[imageFile, firstPSF, finalPSF] = imageDeconv(imageSR, sizePSF, SDPSF, degSim);
imageFile = normImageScale(imageFile);

%Displaying parameters
subplot(2,4,8)
axis off;

str = {sprintf('Cycle number: %d \n', i), sprintf('Deblurring - PSF size = %d \n', sizePSF), sprintf('Deblurring - PSF standard deviation = %f \n', SDPSF), sprintf('Deblurring - PSF degrees of similarity = %d \n \n', degSim), sprintf('Denoising - sigma = %f ', sigma)};
text(0.0,0.5, str);

subplot(2,4,2);
imshow(imageSR, []);
title('After new SR', 'FontSize', fontsize);
axis on;


subplot(2,4,3);
imshow(imageFile, []);
title('After SR-Deblurring', 'FontSize', fontsize);
axis on;

denoisedImage = regularizeImageScale(imageFile);
denoisedImage = denoiseImage(denoisedImage, sigma);

%Noise removal
subplot(2,4,7);
imshow(denoisedImage, []);
title('After SR-Deblurring-Denoising', 'FontSize', fontsize);

subplot(2,4,6);
imshow(finalPSF, []);
title('Final used PSF', 'FontSize', fontsize);
axis on;

subplot(2,4,5);
imshow(firstPSF, []);
title('Initial PSF', 'FontSize', fontsize);
axis on;

end

finalImage = imageFile;

end

