function im_mae = FR_MAE( im_reference,im_distorted )
%im_reference and im_distorted is gray([0 255]) image
im_reference = (im_reference>20);
im_distorted = (im_distorted>20);

% mae越小越好
% im_mae=mean2(abs(im_reference-im_distorted));
im_mae=mean(mean(mean(abs(im_reference-im_distorted))));
% im_mae=mae
