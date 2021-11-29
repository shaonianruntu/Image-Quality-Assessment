clear all
close all
clc

addpath('Codes/Utilities');
addpath('Codes/Eigenface');
addpath('Codes/Fisherface');

setEnvironment;

PathData ='/Users/fangnan/Downloads/NLDA_test';
Methods = {'1013_195053_realtime_newdata_cycrec_1_rep'};
folderGT = 'style';

itrN = 20; 
methodN = length(Methods);
AccList.Fisher = zeros(itrN, methodN);
AccList.Eigen = zeros(itrN, methodN);
AccList.NLDA = zeros(itrN, methodN);

for itr = 1:itrN
    
    fprintf('iteration : %d \n', itr)

    load([PathResult,'Fisherface_Result_', num2str(itr), '.mat']);
    load([PathResult, 'Eigenface_Result_', num2str(itr), '.mat']);
    load([PathResult, 'NLDA_Result_', num2str(itr), '.mat']);


    for iMethod = 1:methodN
        AccList.Fisher(itr, iMethod) = Fisherface_Result{iMethod}.Sketch.accuracy;
        AccList.Eigen(itr, iMethod) = Fisherface_Result{iMethod}.Sketch.accuracy;
        AccList.NLDA(itr, iMethod) = NLDA_Result{iMethod}.Sketch.accuracy;
    end
    
end

AccList.avgFisher = mean(AccList.Fisher);
AccList.avgEigen = mean(AccList.Eigen);
AccList.avgNLDA = mean(AccList.NLDA);
AccList.stdFisher = std(AccList.Fisher);
AccList.stdEigen = std(AccList.Eigen);
AccList.stdNLDA = std(AccList.NLDA);

fprintf('-----------------------\n')
fprintf('avgNLDA : %.5f \n', AccList.avgNLDA)

save ResultAnalysis AccList