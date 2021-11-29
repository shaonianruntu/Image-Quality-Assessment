% Eigenface: Face Recognition based on Synthesized Sketches or Photos
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
addpath('Codes/Eigenface');

setEnvironment;

% folders are of the same name
Methods = {'1pix2pix2006', 'finalsaupdown200650'}; 
% folder of the ground-truth images
folderGT = '0sketches200';

% Load Data
if exist([PathData,'Data.mat','file']) ~= 2
    [trainindex, testindex] = DataPartition(nTrain, nTS, nTA, nTX);
    Data = LoadAllData(trainindex, testindex, PathData, folderGT, Methods);
    save([PathData,'Data.mat'],'Data','-v7.3');
else
    load([PathData,'Data.mat']);
end

if exist([PathResult,'Eigenface_Result.mat'],'file') ~= 2
    Eigenface_Result = Eigenface_Classification(Methods,Data,nTrain);
    save([PathResult,'Eigenface_Result.mat'],'Eigenface_Result');
else
    load([PathResult,'Eigenface_Result.mat']);
end
