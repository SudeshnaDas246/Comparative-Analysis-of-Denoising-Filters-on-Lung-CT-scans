 f = struct;
 f.name = "";
 f.gaer = "";
 
 f.psnr = "";
 f.snr = "";
 f.rmser = "";
 f.mse = "";
 f.M3 = "";
 f.M4 = "";
 f.quality = "";
 f.ssim = "";
 f.AD = "";
 f.SC = "";
 f.NK =  "";
 f.MD = "";
 f.LMSE = ""; 
 f.NAE = "";
 f.noise = "";

ogim = imread("images\Normal case (1).jpg");
noisy  = imread("images\noisy.jpg");

path_directory='images';
original_files=dir([path_directory '/*.jpg']); 

for k=01:length(original_files)
      filename=[path_directory '/' original_files(k).name];
      im=imread(filename);
      a = original_files(k).name;
      nam = erase(a,'.jpg');
      f=metrics(im,ogim,nam,"0.04",f); 
      writetable(struct2table(f),'data.csv');
end
disp(struct2table(f))
 
 