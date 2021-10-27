function im_mae = FR_RMSE( im_reference,im_distorted )
% im_reference and im_distorted is gray([0 255]) image
% im_mae= sqrt(mean2((im_reference-im_distorted).^2));
im_mae= sqrt(mean(mean(mean((im_reference-im_distorted).^2))));
% im_mae=mae
