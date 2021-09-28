im = imread("images\Normal case (1).jpg");
%im = rgb2gray(im);
 
% %*********************************noise0.04**********************************************
 
crim = imread("images\crimmins.jpg");
noisy = imread("images\noisy.jpg");

wie = wiener2(noisy,[3 3]);
imwrite(wie,"images\wiener.jpg");

fro = fcnFrostFilter(noisy,getnhood(strel('disk',3,0)));
imwrite(fro,"images\frost.jpg");

lee = uint8(myLee(noisy));
imwrite(lee,"images\lee.jpg");

ku = kuan(noisy,3);
imwrite(ku,"images\kuan.jpg");

kon = kongres(noisy, [3,3], 3);
imwrite(kon,"images\kongres.jpg");

xd= waveltc(noisy, 3);
imwrite(xd,"images\waveletfiltering.jpg");

srad=srad_new_ver(noisy,3,3);
imwrite(srad,"images\srad.jpg");

linear = linearskale(noisy, [3,3], 3);
imwrite(linear,"images\linearscaling.jpg");

MIM = hmedian(noisy, 3);
imwrite(MIM,"images\hybridmedian.jpg");

hm=homlog(noisy, 3);
imwrite(hm,"images\homlog.jpg");

[Y,~] = kuwahara(noisy,3,3);
imwrite(Y,"images\kuwaharafilter.jpg");

