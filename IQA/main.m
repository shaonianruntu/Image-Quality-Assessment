clear all
close all
clc

% Path of this folder
currentFolder = pwd;
addpath(genpath(currentFolder));

% Path of two image datasets that need to be calculated
refpath = '/Users/fangnan/Downloads/实验图片/测试GT';
dispath = '/Users/fangnan/Downloads/实验图片';

% Subpath of 'dispath'
method_folders = {'Pix2Pix'};

ref_ext = '.jpg';
dis_ext = '.png';

%----------------------------------------

fprintf('IQA Result:\n');
imgN = 2;

methodN = length(method_folders);
score_list1 = zeros(imgN + 3, methodN);
score_list2 = zeros(imgN + 3, methodN);
score_list3 = zeros(imgN + 3, methodN);
score_list4 = zeros(imgN + 3, methodN);
% score_list5 = zeros(imgN + 3, methodN);
score_list6 = zeros(imgN + 3, methodN);
for img_i = 1:imgN
    % fprintf('value %6.2f\n',img_i);
    refimg = imread(fullfile(refpath, [num2str(img_i), ref_ext]));
    % fprintf('ss%d\n',size(refimg));
    mysize=size(refimg);
    if numel(mysize)<=2
        refimg=repmat(refimg,[1,1,3]);
    end
    for method_i = 1:methodN
        disimg = imread(fullfile(dispath, method_folders{method_i}, [num2str(img_i), dis_ext]));
        mysize=size(disimg);
        if numel(mysize)<=2
            disimg=repmat(disimg,[1,1,3]);
        end
        % fprintf('ss%d\n',size(disimg));
        score_list1(img_i, method_i) = FR_PSNR(refimg, disimg);
        score_list2(img_i, method_i) = FR_FSIMc(refimg, disimg);
        score_list3(img_i, method_i) = FR_MSSIM(refimg, disimg);
        score_list4(img_i, method_i) = FR_MAE(refimg, disimg);
        % score_list5(img_i, method_i) = FR_FPM(refimg, disimg);
        score_list6(img_i, method_i) = ScootMeasure(refimg, disimg);
    end
end
score_list1(end-2, :) = mean(score_list1(1:imgN, :));
score_list1(end-1, :) = median(score_list1(1:imgN, :));
score_list1(end, :) = std(score_list1(1:imgN, :));

score_list2(end-2, :) = mean(score_list2(1:imgN, :));
score_list2(end-1, :) = median(score_list2(1:imgN,  :));
score_list2(end, :) = std(score_list2(1:imgN, :));

score_list3(end-2, :) = mean(score_list3(1:imgN, :));
score_list3(end-1, :) = median(score_list3(1:imgN, :));
score_list3(end, :) = std(score_list3(1:imgN, :));

score_list4(end-2, :) = mean(score_list4(1:imgN, :));
score_list4(end-1, :) = median(score_list4(1:imgN, :));
score_list4(end, :) = std(score_list4(1:imgN, :));

% score_list5(end-2, :) = mean(score_list5(1:imgN, :));
% score_list5(end-1, :) = median(score_list5(1:imgN, :));
% score_list5(end, :) = std(score_list5(1:imgN, :));

score_list6(end-2, :) = mean(score_list6(1:imgN, :));
score_list6(end-1, :) = median(score_list6(1:imgN, :));
score_list6(end, :) = std(score_list6(1:imgN, :));

save score_list_PSNR_f2853BSD100 score_list1
save score_list_FR_FSIMc_f2853BSD100 score_list2
save score_list_FR_MSSIM_f2853BSD100 score_list3
save score_list_FR_MAEf2853BSD100 score_list4
% save score_list_FR_FPMf2853BSD100 score_list5
save score_list_SCOOT_f2853BSD100 score_list6

% fprintf('done\n');
fprintf('\nSCOOT: ')
fprintf(num2str(score_list6(imgN+1, :)));
fprintf('PSNR: ');
fprintf(num2str(score_list2(imgN+1, :)));
fprintf('\nSSIM: ')
fprintf(num2str(score_list1(imgN+1, :)));
fprintf('\nFSIM: ')
fprintf(num2str(score_list3(imgN+1, :)));
fprintf('\nMAE: ')
fprintf(num2str(score_list4(imgN+1, :)));
fprintf('\n')
