function NLDA_Result = NLDA_Classification(Methods,Data,nTrain)

for i = 1:length(Methods)
    
    method = Methods{i};
    
    %Synthesized Sketch based Recognition
    TrainData  = [Data{1}.TrSketch Data{i+1}.TrSketch]; % [ground-truth, synthesised]
    TestData   = Data{1}.TeSketch; % ground-truth as query
    
    GalleryData  = Data{i+1}.TeSketch;
    TrainLabel   = [1:nTrain 1:nTrain];
    TestLabel    = [nTrain+1:nTrain+size(TestData,2)];
    GalleryLabel = [nTrain+1:nTrain+size(GalleryData,2)];
    NLDA_Result{i}.Sketch = NLDA(TrainData,TestData,GalleryData,...
        TrainLabel,TestLabel,GalleryLabel,method);
    
%     %Synthesized Photo based Recognition
%     TrainData  = [Data{1}.TrPhoto Data{i+1}.TrPhoto];
%     TestData   = Data{i+1}.TePhoto;
%     GalleryData = Data{1}.TePhoto;
%     
%     TrainLabel   = [1:nTrain 1:nTrain];
%     TestLabel    = [nTrain+1:nTrain+size(TestData,2)];
%     GalleryLabel = [nTrain+1:nTrain+size(GalleryData,2)];
%     NLDA_Result{i}.Photo = NLDA(TrainData,TestData,GalleryData,...
%         TrainLabel,TestLabel,GalleryLabel);
    
end