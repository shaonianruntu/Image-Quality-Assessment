function im_quality = FR_PSNR( im_reference,im_distorted )
% im_reference and im_distorted is gray([0 255]) image;
% mse=mean2((im_reference-im_distorted).^2);
mse=mean(mean(mean((im_reference-im_distorted).^2)));
im_quality=10*log10(255^2/mse);