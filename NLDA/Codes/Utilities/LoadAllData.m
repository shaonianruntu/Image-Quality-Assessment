function Data = LoadAllData(trainindex, testindex, Path, folderGT, Methods)

Data{1}.trainindex = trainindex;
Data{1}.testindex  = testindex;


% Ground truth data 
[TrSketch, TeSketch] = ...
    LoadData(trainindex,testindex,Path,folderGT);
Data{1}.TrSketch = TrSketch;
Data{1}.TeSketch = TeSketch;
clear TrSketch TeSketch;

% Synthesised data 
for iMethod = 1:length(Methods)
    [TrSketch, TeSketch] = ...
        LoadData(trainindex, testindex, Path, Methods{iMethod});
    Data{iMethod+1}.TrSketch = TrSketch;
    Data{iMethod+1}.TeSketch = TeSketch;
    clear TrSketch TeSketch;
end




%%
% % Ground truth data for MWF, Positino, TFSPS methods
% [TrPhoto TrSketch TePhoto TeSketch TrPhotoRGB TePhotoRGB] = ...
%     LoadData(trainindex,testindex,Path,'GR');
% Data{1}.TrPhoto  = TrPhoto;
% Data{1}.TrSketch = TrSketch;
% Data{1}.TePhoto  = TePhoto;
% Data{1}.TeSketch = TeSketch;
% Data{1}.TrPhotoRGB = TrPhotoRGB;
% Data{1}.TePhotoRGB = TePhotoRGB;
% clear TrPhoto TrSketch TePhoto TeSketch TrPhotoRGB TePhotoRGB;
% 
% % Ground truth data for SFS method
% [TrPhoto2 TrSketch2 TePhoto2 TeSketch2] = ...
%     LoadData2(trainindex,testindex,Path,'GR');
% Data{1}.TrPhoto_SFS  = TrPhoto2;
% Data{1}.TrSketch_SFS = TrSketch2;
% Data{1}.TePhoto_SFS  = TePhoto2;
% Data{1}.TeSketch_SFS = TeSketch2;
% clear TrPhoto2 TrSketch2 TePhoto2 TeSketch2;
% 
% % Ground truth data for SFS-SVR method
% [TrPhoto3 TrSketch3 TePhoto3 TeSketch3] = ...
%     LoadData3(trainindex,testindex,Path,'GR');
% Data{1}.TrPhoto_SVR  = TrPhoto3;
% Data{1}.TrSketch_SVR = TrSketch3;
% Data{1}.TePhoto_SVR  = TePhoto3;
% Data{1}.TeSketch_SVR = TeSketch3;
% clear TrPhoto3 TrSketch3 TePhoto3 TeSketch3;
% 
% [M_TrPhoto M_TrSketch M_TePhoto M_TeSketch M_TrPhotoRGB M_TePhotoRGB] = ...
%     LoadData(trainindex,testindex,Path,'MWF');
% Data{2}.TrPhoto  = M_TrPhoto;
% Data{2}.TrSketch = M_TrSketch;
% Data{2}.TePhoto  = M_TePhoto;
% Data{2}.TeSketch = M_TeSketch;
% Data{2}.TrPhotoRGB = M_TrPhotoRGB;
% Data{2}.TePhotoRGB = M_TePhotoRGB;
% clear M_TrPhoto M_TrSketch M_TePhoto M_TeSketch M_trPhotoRGB M_TePhotoRGB
% 
% [P_TrPhoto P_TrSketch P_TePhoto P_TeSketch P_TrPhotoRGB P_TePhotoRGB] = ...
%     LoadData(trainindex,testindex,Path,'Position');
% Data{3}.TrPhoto  = P_TrPhoto;
% Data{3}.TrSketch = P_TrSketch;
% Data{3}.TePhoto  = P_TePhoto;
% Data{3}.TeSketch = P_TeSketch;
% Data{3}.TrPhotoRGB = P_TrPhotoRGB;
% Data{3}.TePhotoRGB = P_TePhotoRGB;
% clear P_TrPhoto P_TrSketch P_TePhoto P_TeSketch P_trPhotoRGB P_TePhotoRGB
% 
% [T_TrPhoto T_TrSketch T_TePhoto T_TeSketch T_TrPhotoRGB T_TePhotoRGB] = ...
%     LoadData(trainindex,testindex,Path,'TFSPS');
% Data{6}.TrPhoto  = T_TrPhoto;
% Data{6}.TrSketch = T_TrSketch;
% Data{6}.TePhoto  = T_TePhoto;
% Data{6}.TeSketch = T_TeSketch;
% Data{6}.TrPhotoRGB = T_TrPhotoRGB;
% Data{6}.TePhotoRGB = T_TePhotoRGB;
% clear T_TrPhoto T_TrSketch T_TePhoto T_TeSketch T_trPhotoRGB T_TePhotoRGB
% 
% [SFS_TrPhoto SFS_TrSketch SFS_TePhoto SFS_TeSketch] = ...
%     LoadData(trainindex,testindex,Path,'SFS');
% Data{4}.TrPhoto  = SFS_TrPhoto;
% Data{4}.TrSketch = SFS_TrSketch;
% Data{4}.TePhoto  = SFS_TePhoto;
% Data{4}.TeSketch = SFS_TeSketch;
% clear SFS_TrPhoto SFS_TrSketch SFS_TePhoto SFS_TeSketch
% 
% [SVR_TrPhoto SVR_TrSketch SVR_TePhoto SVR_TeSketch] = ...
%     LoadData(trainindex,testindex,Path,'SFS-SVR');
% Data{5}.TrPhoto  = SVR_TrPhoto;
% Data{5}.TrSketch = SVR_TrSketch;
% Data{5}.TePhoto  = SVR_TePhoto;
% Data{5}.TeSketch = SVR_TeSketch;
% clear SVR_TrPhoto SVR_TrSketch SVR_TePhoto SVR_TeSketch
