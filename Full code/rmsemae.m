function [rmse mae] = rmsemae( img1, img2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
im1 = double(img1);
im2 = double(img2);
rmse = sqrt(sum((im1(:)-im2(:)).^2) / numel(im1));
rmse = rmse;

absDiff = abs(double(im1) - double(im2));
mae = mean(absDiff(:));

mae = mae;
return

end

