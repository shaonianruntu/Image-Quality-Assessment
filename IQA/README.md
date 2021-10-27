# IQA (Matlab Version) Usage

**PSNR, FSIM, SSIM, MAE, FPM, SCOOT**

run `main.m`.

## Input

> You need to modify these variables based on your test path.

`refpath`: Path of reference image dataset.

`dispath`: Path of test image dataset. `method_folders` is the subdirectories of `dispath`.

`ref_ext`: Filename extension of reference image dataset.

`dis_ext`: Filename extension of test image dataset.

## Output

IQA indicator (PSNR, FSIM, SSIM, MAE & FPM) results of two calculation datasets.

Example:

```
IQA Result:
PSNR: 32.251
FSIM: 0.84101
SSIM: 0.69522
MAE: 0.00122
FPM: 0.81917
SCOOT: 0.8634
```