function f=metrics(I,K,name,noise,f);
 %I = original image
 %K = denoised image

%I=double(I); K=double(K);
 %Geometic Average Error
 gaer = GAE(I,K);
 
 %calculate the mean square error mse
 mse = immse(I,K);
 
 %calculate the square root of the mean square error
 rmser=RMSE(I, K);
 
 %Calculate the peak-signal-to-noise radio
 %calculate the signal-to-noise radio snr
 
 [peaksnr, snr] = psnr(I,K);
 
 %Calculate the Minkwofski measure
 [M3, M4] = minkowski(I, K);
 
 %Calculate the universal quality index
 [quality, ~] = img_qi(I,K);
 
 %Calculate the structural similarity index
 ss = ssim(K,I);
 
  %calculate aditional metrics 
 [MSE,PSNR,AD,SC,NK,MD,LMSE,NAE]=iq_measures(I,K);
 %metrics=[metrics, AD, SC, NK, MD, LMSE, NAE];
 
%  f.name = name;
%  f.gaer = gaer;
%  f.mse = mse;
%  f.snrad = snrad;
%  f.rmser = rmser;
%  f.psnrad = psnrad;
%  f.M3 = M3;
%  f.M4 = M4;
%  f.quality = quality;
%  f.mssim = mssim;
%  f.AD = AD;
%  f.SC = SC;
%  f.NK =  NK;
%  f.MD = MD;
%  f.LMSE = LMSE;
%  f.NAE = NAE;
 

 f.name = [f.name;name];
 f.gaer = [f.gaer;gaer];
 f.mse = [f.mse;mse];
 f.snr = [f.snr;snr];
 f.rmser = [f.rmser;rmser];
 f.psnr = [f.psnr;peaksnr];
 f.M3 = [f.M3;M3];
 f.M4 = [f.M4;M4];
 f.quality = [f.quality;quality];
 f.ssim = [f.ssim;ss];
 f.AD = [f.AD;AD];
 f.SC = [f.SC;SC];
 f.NK = [f.NK; NK];
 f.MD = [f.MD;MD];
 f.LMSE = [f.LMSE;LMSE];
 f.NAE = [f.NAE;NAE];
 f.noise = [f.noise;noise];
 
 %MEM=[MEM, metrics']; 
 %f= metrics; 
