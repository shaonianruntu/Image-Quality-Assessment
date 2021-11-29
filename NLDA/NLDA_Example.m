% NLDA: Face Recognition based on Synthesized Sketches or Photos
% Written by Nannan Wang
% 2014.10.27
% Xidian University
% nannanwang.xidian@gmail.com
% Recognition Methods: Eigenface, Fisherface, NLDA, RSLDA, SRC
% 
% Modified by Fei Gao
% 2018.08.24
% Hangzhou Dianzi Univeristy
% gaofei@hdu.edu.cn

clear;
clc;
close all;

addpath('Codes/Utilities');
addpath('Codes/NLDA');

setEnvironment;

% Methods = {'MWF','Position','SFS','SFS-SVR','TFSPS'};
% folders are of the same name
Methods = {'1pix2pix2006', 'finalsaupdown200650'}; 
% folder of the ground-truth images
folderGT = '0sketches200';

% Load Data
if exist([PathData,'Data.mat','file']) ~= 2
    [trainindex, testindex] = DataPartition(nTrain,nTS,nTA,nTX);
    Data = LoadAllData(trainindex,testindex,PathData, folderGT, Methods);
    save([PathData,'Data.mat'],'Data','-v7.3');
else
    load([PathData,'Data.mat']);
end

if exist([PathResult,'NLDA_Result.mat'],'file') ~= 2
    NLDA_Result = NLDA_Classification(Methods,Data,nTrain);
    save([PathResult,'NLDA_Result.mat'],'NLDA_Result');
else
    load([PathResult,'NLDA_Result.mat']);
end

