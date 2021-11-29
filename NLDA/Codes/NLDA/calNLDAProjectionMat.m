function [ldaProjectionMat D] = calNLDAProjectionMat(trainData, labelVec, projectionDim)
%% Description of the calNLDAProjectionMat Function
%  This programm is coded according to the IJCV 2006 (citation 92, Xiaogang Wang)
%  paper: 'Random sampling for subspace face recognition'
%
%  Author: Changxing Ding @ University of Technology, Sydney
%  Date: 21 Otc, 2012
%
%  This program is to calculate the LDA projection matrix in the Null Space LDA algorithm
%
%  Note:(1)
%
%  Input Parameters:
%    trainData: the input training data;
%    labelVec: the vector whose each element stands for the subject label
%              for the corresponding training image data;
%    projectionDim: the ultimate dimension of projected image data.
%   
%  Output parameter:
%    ldaProjectionMat: the calculated LDA projection matrix.
%
%% Calculate the Null Space of the Within Class Scatter Matrix Sw
% calculate the within class scatter matrix Sw
[~, Sw, Sb] = calSwAndSb(trainData, labelVec);

% calculate the null space of Sw
% [V,D] = eig(Sw);
% [~, index] = sort(diag(D), 'descend');
% V = V(:, index);
% nullSpaceSw = V(:, (size(trainData, 2) - length(unique(labelVec)) +1):end);  % the null space of Sw
nullSpaceSw = null(Sw);

% project Sb to the null space of Sw
SbNullSpacePro = nullSpaceSw'*Sb*nullSpaceSw;


%% Calculate the Largest Eigenvectors of SbNullSpacePro
[V,D] = eig(SbNullSpacePro);
[D, index] = sort(diag(D), 'descend');
% the ultimate dimension of feature vectors after all projections

if projectionDim > length(D)
    projectionDim = length(D);
end

if isempty(projectionDim)
    
    for i = 1:length(D)
        
        if isreal(D(i))
            
            continue;
            
        else
            
            projectionDim = i - 1;
            break;
            
        end
        
        
    end
    
    projectionDim = length(D);
    
end

prinSpaceSb = V(:, index(1:projectionDim));
D           = D(index(1:projectionDim));


%% Calculate the Overall Projection Matrix
ldaProjectionMat = nullSpaceSw*prinSpaceSb;