%First function
%then run saving outputs
%after that perfmeasure

clc
clear
im = imread('images\Normal case (1).jpg');
%im = rgb2gray(im);
crim = imread('images\crimmins.jpg');
noisy = imnoise(im,'speckle', 0.01);

wie = wiener2(noisy,[3 3]);
fro = fcnFrostFilter(noisy,getnhood(strel('disk',3,0)));

n01 = table;
p = []; s = []; rm = []; ma = []; ms = []; qua = []; ss = [];

[pc, snrc] = psnr(crim,im);
[pw, snrw] = psnr(wie,im);
p = [p pc pw]; s = [s snrc snrw];
  
[rmc, maec] = rmsemae(crim, im);
[rmw, maew] = rmsemae(wie, im);
ma = [ma maec maew]; rm = [rm rmc rmw];
  
errc = immse(crim,im);
errw = immse(wie,im);
ms = [ms errc errw];
    
[qc, ~] = imageQualityIndex (crim, im);
[qw, ~] = imageQualityIndex (wie, im);
qua = [qua qc qw];
    
ssc = ssim( crim , im);
ssw = ssim( wie , im );
ss = [ss ssc ssw];

saving_outputs
perfmeasure

