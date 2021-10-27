# Image-Quality-Assessment

## FID

Pytorch version of 

**FID, Clean FID, SIFID**.

## IQA

Matlab version of 

**PSNR, FSIM, SSIM, MAE, FPM, SCOOT**.

> 传统方法中常用的 SSIM，MAE，但是在素描任务中，对于生成真实图像的 GAN，这两个指标的用处不大。

> 另外，需要注意的是，Octave的mean2支持2维数组，对于RGB图像，可以使用mean(mean(mean()))代替。

## Model Parameters and FLOPs

https://github.com/Lyken17/pytorch-OpCounter


