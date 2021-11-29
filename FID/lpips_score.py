#!/usr/bin/env python3
import os
import pathlib
from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter

import torch
import numpy as np
from imageio import imread
from scipy import linalg
from torch.autograd import Variable
from torch.nn.functional import adaptive_avg_pool2d

from PIL import Image
import torchvision.transforms as transforms

from inception import InceptionV3
import lpips

parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)

parser.add_argument('--gpu',
                    default='1',
                    type=str,
                    help='GPU to use (leave blank for CPU only)')

parser.add_argument('--path',
                    type=str,
                    nargs=2,
                    help=('Path to the generated images or '
                          'to .npz statistic files'))


def calculate_lpips_given_paths(paths, cuda):
    """Calculates the SIFID of two paths"""
    for p in paths:
        if not os.path.exists(p):
            raise RuntimeError('Invalid path: %s' % p)

    model = lpips.LPIPS(net='alex')
    if cuda:
        model.cuda()

    path1 = pathlib.Path(paths[0])
    files1 = sorted(path1.glob('*.jpg'))
    path2 = pathlib.Path(paths[1])
    files2 = sorted(path2.glob('*.jpg'))

    lpips_values = []

    for i in range(len(files2)):
        file1 = Image.open(files1[i])
        file2 = Image.open(files2[i])

        file1 = transforms.functional.to_tensor(file1).unsqueeze_(0).cuda()
        file2 = transforms.functional.to_tensor(file2).unsqueeze_(0).cuda()

        value = model.forward(file1, file2)
        lpips_values.append(value)

    lpips_value = np.asarray(lpips_values, dtype=np.float32).mean()

    return lpips_value


if __name__ == '__main__':
    args = parser.parse_args()
    os.environ['CUDA_VISIBLE_DEVICES'] = args.gpu

    lpips_values = calculate_lpips_given_paths(args.path, args.gpu != '')

    print('LPIPS: ', lpips_values)
