function f = kongres(g, nhood, niterations)
%
%SPECKLE REDUCTION  FILTER. Christos Loizou 2001. lsmvminmax
%Speckle Reduction in Ultrasound Imaging
%Date: 	5/9/2001
%Source: Institute of Cancer Research: Royal Marsden Hospital, Joint Departement
%of Physics, Downs Road, Sutton Surrey, SM2, 5PT England
%Title: Fast Image Processing systems for evaluating the clinical potential of
%Ultrasound speckle Suppression and Parametric Imaging
%Filters the multiplicative noise in Ultrasound Images
%Utilizes the local statistics of the noise image g(m,n )
if isa(g, 'uint8')
  u8out = 1;
  if (islogical(g))
    % It doesn't make much sense to pass a binary image
    % in to this function, but just in case.
    logicalOut = 1;
    g = double(g);
  else
    logicalOut = 0;  
    g = double(g)/255;    
  end
else
  u8out = 0;
end
%Estimate the size of the image
[ma ,na] = size(g);
%Estimate the midle of the processing window, which takes onle values 3, 5 7,. . 
z=(nhood(1)-1)/2;
%Calculate the noise and the noise variance in the image 
stdnoise=(std2(g).*std2(g))/mean2(g);
noisevar=stdnoise; %noise variance 
% stdnoise=std2(g)/mean2(g);
% noisevar=stdnoise*stdnoise; %noise variance 
%Initialize the picture f (new picture) with zeros
f=g;
for i = 1:niterations
  % fprintf('\rIteration %d',i);
  if i >=2 
      g=f;
  end
%Calculation of Mmin and Mmax (probability density function of the image)
Mmin=1; Mmax=0.0;
Mmin=min(g(:));
Mmax=max(g(:));
x=sort(g);  % sort the image elements in x
ind=ma*na;
if Mmin==0
    for k=1:ind
        Mmin=x(k);
        if Mmin>0
            Mmin=Mmin;
            break;
        end
    end
end
if Mmax==1
    for k=ind:-1:1
     Mmax=x(k);
        if Mmax<1
            Mmax=Mmax;
            break;
        end
    end
end   
 
%Estimate the local mean of f.
localMean = filter2(ones(nhood), g) / prod(nhood);
%Estimate of the local variance of f.
localVar = filter2(ones(nhood), g.^2) / prod(nhood) - localMean.^2;
m2 = 1.0 +(localVar./(max((localMean.*localMean),noisevar)));
k = abs((m2 -Mmax) ./ (Mmax + Mmin));
f = localMean +  k.* (g- localMean);
end
% fprintf('\n');
%statistics(g, f, ma, na);
if u8out==1,
  if (logicalOut)
    f = uint8(f);
  else
    f = uint8(round(f*255));
  end
end
 figure, imshow(f);
 title('Image filtered by kongres filter');
