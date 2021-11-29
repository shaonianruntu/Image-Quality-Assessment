function [TrSketch, TeSketch] = LoadData(trainindex,testindex,Path,Method)
% function [TrPhoto TrSketch TePhoto TeSketch TrPhotoRGB TePhotoRGB] = LoadData(trainindex,testindex,Path,Method)

% TrPhoto  = [];
TrSketch = [];
% TePhoto  = [];
TeSketch = [];
% TrPhotoRGB = [];
% TePhotoRGB = [];

% for i = 1:length(trainindex)
%     
%     photo      = imread([Path,Method,'/Photo/',num2str(trainindex(i)),'.jpg']);
%     TrPhotoRGB = [TrPhotoRGB photo(:)];
%     if size(photo,3) == 3
%         photo      = rgb2gray(photo);
%     end
%     TrPhoto    = [TrPhoto photo(:)];
%     
% end
% % TrPhoto = double(TrPhoto);
% % TrPhotoRGB = double(TrPhotoRGB);
% 
% for i = 1:length(testindex)
%     
%     photo      = imread([Path,Method,'/Photo/',num2str(testindex(i)),'.jpg']);
%     TePhotoRGB = [TePhotoRGB photo(:)];
%     if size(photo,3) == 3
%         photo      = rgb2gray(photo);
%     end
%     TePhoto    = [TePhoto photo(:)];
%     
% end
% % TePhoto       = double(TePhoto);
% % TePhotoRGB = double(TePhotoRGB);

% fprintf('%s : start loading training sketches \n', Method);

for i = 1:length(trainindex)
    imlist = dir(strcat(Path,Method,'*.jpg'));
    name = strcat(Path,Method,imlist(trainindex(i)).name);
    sketch  = imread(name);
    if size(sketch,3) == 3
        sketch = rgb2gray(sketch);
    end
    TrSketch = [TrSketch sketch(:)];
    
end
% TrSketch = double(TrSketch);

% fprintf('%s : start loading testing sketches \n', Method);

for i = 1:length(testindex)
    imlist = dir(strcat(Path,Method,'*.jpg'));
    name = strcat(Path,Method,imlist(testindex(i)).name);
    sketch  = imread(name);
    if size(sketch,3) == 3
        sketch = rgb2gray(sketch);
    end
    TeSketch = [TeSketch sketch(:)];
    
end
% TeSketch = double(TeSketch);

fprintf('%s : end loading data \n', Method);

