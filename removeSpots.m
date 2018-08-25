function [finalImage] = removeSpots(imageFile)
%Remove black sports on a white surrounding in a binary image

finalImage = imageFile;

finalImage(1,:) = 1;
finalImage(end,:) = 1

finalImage = imfill(finalImage,'holes');

finalImage = finalImage(2:end-1, 2:end-1);

end

