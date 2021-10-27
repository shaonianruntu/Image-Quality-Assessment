function im_pfm = FR_FPM( im_reference,im_distorted )
%im_reference and im_distorted is gray([0 255]) image
im_reference = (im_reference>20);
im_distorted = (im_distorted>20);

% pfm 越大越好，边缘位置生成比例
idx = (im_reference==0);
im_pfm = mean2(im_reference(idx)==im_distorted(idx));
% im_mae=mae
