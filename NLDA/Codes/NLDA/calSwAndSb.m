function [meanAllData, Sw, Sb] = calSwAndSb(inputData, labelVec)
%% Description of the calSwAndSb Function
%  This programm is coded according to the PAMI 1997(citation 6635, PN Belhumeur & JP Hespanha)
%  paper: 'Eigenfaces vs. fisherfaces: Recognition using class specific linear projection'
%
%  Author: Changxing Ding @ University of Technology, Sydney
%  Date: 18 Otc, 2012
%
%  This program is to calculate the within class scatter matrix and the
%  between class scatter matrix.
%
%  Note:(1)
%
%  Input Parameters:
%    inputData: the matrix containing the data of all subjects;
%    labelVec: the vector that indicates which subject does each column of
%              inputData belongs to;
%
%  Output parameter:
%    meanAllData: the mean data of the input matrix inputData;
%    Sw: within class scatter matrix;
%    Sb: between class scatter matrix;
%
subjectVec = unique(labelVec);
meanAllData = mean(inputData, 2);
Sw = zeros(size(inputData, 1), 'double');  % within class scatter matrix
Sb = zeros(size(inputData, 1), 'double');  % between class scatter matrix

for i=1:length(subjectVec)
    subjectData = inputData(:,labelVec==subjectVec(i));
    meanSubjectData = mean(subjectData, 2);
    subjectData = subjectData - repmat(meanSubjectData, 1, size(subjectData, 2));
    Sw = Sw + subjectData*subjectData';
    Sb = Sb + size(subjectData, 2)*(meanSubjectData - meanAllData)*(meanSubjectData - meanAllData)';
end