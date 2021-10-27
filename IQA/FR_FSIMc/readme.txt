The FSIM/FSIMC values are computed (using FeatureSIM.m) for 6 publicly available IQA databases, including TID2008 database, CSIQ database, LIVE database, IVC database, Toyama-MICT database, and Cornell A57 database. The results (in Matlab .mat format) are provided here, together with performance evaluations based on Spearman rank order correlation coefficient (SROCC) and Kendall rank order correlation coefficient (KROCC), for future comparisons. Each result file contains a n by 3 matrix, where n denotes the number of distorted images in the database. The first column is the FSIM values, the second column is the FSIMC values, and the third column is the mos/dmos values provided by the database. For example, you can use the following matlab code to calculate the SROCC and KROCC values for FSIM and FSIMC values obtained on the TID2008 database:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
matData = load('FSIMOnTID2008.mat');
FSIMOnTID2008 = matData.FSIMOnTID2008;
FSIM_TID_SROCC = corr(FSIMOnTID2008(:,1), FSIMOnTID2008(:,3), 'type', 'spearman');
FSIM_TID_KROCC = corr(FSIMOnTID2008(:,1), FSIMOnTID2008(:,3), 'type', 'kendall');
FSIMc_TID_SROCC = corr(FSIMOnTID2008(:,2), FSIMOnTID2008(:,3), 'type', 'spearman');
FSIMc_TID_KROCC = corr(FSIMOnTID2008(:,2), FSIMOnTID2008(:,3), 'type', 'kendall');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Lin Zhang, Lei Zhang, X. Mou and D. Zhang, ¡°FSIM: A Feature Similarity Index for Image Quality Assessment,¡± accepted subject to minor revision, IEEE Trans. on Image Processing.
http://www4.comp.polyu.edu.hk/~cslzhang/IQA/TIP_IQA_FSIM.pdf

