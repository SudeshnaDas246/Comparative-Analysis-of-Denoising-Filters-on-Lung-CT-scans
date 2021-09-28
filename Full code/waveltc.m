function xd= waveltc(g, nitterations)
%
% Wavelet filtering 
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

%filter the image with wiener2 first
%g= wiener2(g,[5 5]);

h = waitbar(0,'Filtering Image...');

for i = 1:nitterations
  % fprintf('\rIteration %d',i);
  if i >=2 
      g=xd;
  end
  
    [thr, sorh, kepapp]=ddencmp('den', 'wv', g);
    %g= round(log(double(g)).*255);
    xd=wdencmp('gbl', g, 'sym4', 2, thr, sorh, kepapp); 

    % update waitbar
    waitbar(i/nitterations, h);
    
end 		% end for i itterations
%xd=exp(xd)./255;

% subplot (2,2,1), imshow(g); title ('original image');
% subplot (2,2,2), imshow(xd);
% title('Image after wavelet filtering');

close(h)

if u8out==1,
  if (logicalOut)
    xd = uint8(xd);
  else
    xd = uint8(round(xd*255));
  end
end