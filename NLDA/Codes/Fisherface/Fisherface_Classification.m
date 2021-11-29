function Fisherface_Result = Fisherface_Classification(Methods, Data, nTrain)

for i = 1:length(Methods)
    
    method = Methods{i};
    
    %Synthesized Sketch based Recognition
    TrainData  = [Data{1}.TrSketch Data{i+1}.TrSketch];
    TestData   = Data{1}.TeSketch;
    
    GalleryData  = Data{i+1}.TeSketch;
    TrainLabel   = [1:nTrain 1:nTrain];
    TestLabel    = [nTrain+1:nTrain+size(TestData,2)];
    GalleryLabel = [nTrain+1:nTrain+size(GalleryData,2)];
    Fisherface_Result{i}.Sketch = Fisherface(TrainData,TestData,GalleryData,...
        TrainLabel,TestLabel,GalleryLabel,300,method);
    
%     %Synthesized Photo based Recognition
%     if i == 3 % SFS
%         TrainData   = [Data{1}.TrPhoto_SFS Data{i+1}.TrPhoto];
%         TestData    = Data{i+1}.TePhoto;
%         GalleryData = Data{1}.TePhoto_SFS;
%     elseif i == 4 % SFS-SVR
%         TrainData   = [Data{1}.TrPhoto_SVR Data{i+1}.TrPhoto];
%         TestData    = Data{i+1}.TePhoto;
%         GalleryData = Data{1}.TePhoto_SVR;
% %     elseif i == 1
% %         TrainData  = Data{1}.TrPhoto;
% %         TestData   = Data{i+1}.TePhoto;
% %         GalleryData = Data{1}.TePhoto;
%     else % other methods
%         TrainData  = [Data{1}.TrPhoto Data{i+1}.TrPhoto];
%         TestData   = Data{i+1}.TePhoto;
%         GalleryData = Data{1}.TePhoto;
%     end
%     
%     TrainLabel   = [1:nTrain 1:nTrain];
%     TestLabel    = [nTrain+1:nTrain+size(TestData,2)];
%     GalleryLabel = [nTrain+1:nTrain+size(GalleryData,2)];
%     Fisherface_Result{i}.Photo = Fisherface(TrainData,TestData,GalleryData,...
%         TrainLabel,TestLabel,GalleryLabel,600);
    
end