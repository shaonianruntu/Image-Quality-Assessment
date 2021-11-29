%function [trainindex, testindex] = DataPartition(nTrain,nTS,nTA,nTX)

% Assign some number of images to each sub-database
%nS = ceil(nTS/(nTS+nTA+nTX)*nTrain);
%nA = ceil(nTA/(nTS+nTA+nTX)*nTrain);
%nX = nTrain - nS - nA;
% nS = 0;
% nA = 0;
% nX = nTrain;

% Random Sampling Training Data and Testing Data
%trainindex = [];
%testindex  = [];

%index = randperm(nTS);
%trainindex = [trainindex index(1:nS)];
%testindex  = [testindex index(nS+1:end)];

%index = nTS + randperm(nTA);
%trainindex = [trainindex index(1:nA)];
%testindex  = [testindex index(nA+1:end)];

%index = nTS + nTA + randperm(nTX);
%trainindex = [trainindex index(1:nX)];
%testindex  = [testindex index(nX+1:end)];
function [trainindex, testindex] = DataPartition(nTrain,nT)

% Random Sampling Training Data and Testing Data
trainindex = [];
testindex  = [];

index = randperm(nT);
trainindex = [trainindex index(1:nTrain)];
testindex  = [testindex index(nTrain+1:end)];