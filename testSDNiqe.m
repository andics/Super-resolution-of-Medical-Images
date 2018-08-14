function testSDNiqe(imageFile)
%Test different standard deviation values for deblurring and check which
%one produces the best score

previousFig = gcf;

figure;
set(gcf,'units','normalized','outerposition',[0 0 1 1])

range = [0.2:0.1:2];

for i=1:length(range)
    
cSDPSF = range(1,i);

testImage = @(SDPSF) niqe(imageDeconv(imageFile, round(SDPSF*6+1), SDPSF, 2));

plotData(i,:) = [cSDPSF, testImage(cSDPSF)];

end

plot(plotData(:,1), plotData(:,2));

figure(previousFig);

end

