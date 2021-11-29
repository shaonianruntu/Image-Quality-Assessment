clear all
close all
clc

addpath('Codes/Utilities');
addpath('Codes/Fisherface');
addpath('Codes/Eigenface');
addpath('Codes/NLDA');

setEnvironment;   % set paths and sample numbers

PathData = '/Users/fangnan/Downloads/NLDA_test/';  
Methods = {'1013_195053_realtime_newdata_cycrec_1_rep/'};
folderGT = 'style/';

itrN = 20; 

for itr = 1:itrN
    
    fprintf('iteration : %d \n', itr)
    
    % Load Data
    if exist([PathmatData,'Data_', num2str(itr), '.mat','file']) ~= 2
        %[trainindex, testindex] = DataPartition(nTrain,nTS,nTA,nTX);
        [trainindex, testindex] = DataPartition(nTrain,nT);
        Data = LoadAllData(trainindex, testindex, PathData, folderGT, Methods);
        save([PathmatData, 'Data_', num2str(itr), '.mat'], 'Data', '-v7.3');
    else
        load([PathmatData,'Data_', num2str(itr), '.mat']);
    end

    Fisherface_Result = Fisherface_Classification(Methods, Data, nTrain);
    Eigenface_Result = Eigenface_Classification(Methods,Data,nTrain);
    NLDA_Result = NLDA_Classification(Methods,Data,nTrain);
    save([PathResult,'Fisherface_Result_', num2str(itr), '.mat'],'Fisherface_Result');
    save([PathResult,'Eigenface_Result_', num2str(itr), '.mat'],'Eigenface_Result');
    save([PathResult,'NLDA_Result_', num2str(itr), '.mat'],'NLDA_Result');
    
end
