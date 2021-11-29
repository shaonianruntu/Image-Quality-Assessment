from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter
from inception import InceptionV3
import os

from fid_score import calculate_fid_given_paths
from sifid_score import calculate_sifid_given_paths
from cleanfid import fid as cleanfid
import lpips

parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)

parser.add_argument('--gpu',
                    default='0',
                    type=str,
                    help='GPU to use (leave blank for CPU only)')

parser.add_argument('--path',
                    type=str,
                    nargs=2,
                    help=('Path to the generated images or '
                          'to .npz statistic files'))

parser.add_argument('--fid-batch-size',
                    type=int,
                    default=8,
                    help='Batch size to use')

parser.add_argument('--fid-dims',
                    type=int,
                    default=2048,
                    choices=list(InceptionV3.BLOCK_INDEX_BY_DIM),
                    help=('Dimensionality of Inception features to use. '
                          'By default, uses pool3 features'))

parser.add_argument('--sifid-batch-size',
                    type=int,
                    default=1,
                    help='Batch size to use')

parser.add_argument('--sifid-dims',
                    type=int,
                    default=64,
                    choices=list(InceptionV3.BLOCK_INDEX_BY_DIM),
                    help=('Dimensionality of Inception features to use. '
                          'By default, uses pool3 features'))

if __name__ == '__main__':
    args = parser.parse_args()
    os.environ['CUDA_VISIBLE_DEVICES'] = args.gpu

    fid_value = calculate_fid_given_paths(args.path, args.fid_batch_size,
                                          args.gpu != '', args.fid_dims)

    sifid_values = calculate_sifid_given_paths(args.path,
                                               args.sifid_batch_size,
                                               args.gpu != '', args.sifid_dims)

    cleanfid_values = cleanfid.compute_fid(args.path[0], args.path[1])

    lpips_value = lpips.LPIPS(net='alex').forward(args.path[0], args.path[1])

    print("=" * 80)
    print("FID Result:")
    print('FID: ', fid_value)
    print('SIFID: ', sifid_values)
    print('CLEAN FID: ', cleanfid_values)
    print('LPIPS: ', lpips_value)
