# Image-Quality-Assessment

## FID

Pytorch version of

- [(FID) Fréchet inception distance](https://en.wikipedia.org/wiki/Fréchet_inception_distance): smaller is better
- [(SIFID) Single Image Fréchet Inception Distance](https://github.com/tamarott/SinGAN): smaller is better
- [(CleanFID) On Buggy Resizing Libraries and Surprising Subtleties in FID Calculation](https://github.com/GaParmar/clean-fid): smaller is better
- [(LPIPS) Learned Perceptual Image Patch Similarity](https://github.com/richzhang/PerceptualSimilarity): smaller is better

## IQA

Matlab version of

- [(SCOOT) Scoot: A Perceptual Metric for Facial Sketches](http://mmcheng.net/scoot/)
- [(PSNR) Peak Signal-to-Noise Ratio](https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio)
- [(SSIM) Structural Similarity Index Measure](https://en.wikipedia.org/wiki/Structural_similarity)
- [(FSIM) Feature Similarity Index Measure](https://ieeexplore.ieee.org/document/5705575)
- [(MAE) Mean Absolute Error](https://en.wikipedia.org/wiki/Mean_absolute_error)

## NLDA

Matlab version of

- [(NLDA) A new LDA-based face recognition system which can solve the small sample size problem](https://www.sciencedirect.com/science/article/pii/S0031320399001399)

> 传统方法中常用的 SSIM，MAE，但是在素描任务中，对于生成真实图像的 GAN，这两个指标的用处不大。
>
> 另外，需要注意的是，Octave 的 mean2 支持 2 维数组，对于 RGB 图像，需要使用 mean(mean(mean()))代替。

## Model Parameters and FLOPs

https://github.com/Lyken17/pytorch-OpCounter
