function [TrPhoto TrSketch TePhoto TeSketch] = LoadData3(trainindex,testindex,Path,Method)

TrPhoto  = [];
TrSketch = [];
TePhoto  = [];
TeSketch = [];

for i = 1:length(trainindex)
    
    photo   = imread([Path,Method,'/Photo/',num2str(trainindex(i)),'.jpg']);
    if trainindex(i) < 101
        photo = photo(28:227,24:178,:);
    else
        photo = photo(26:225,26:180,:);
    end
    photo   = rgb2gray(photo);
    TrPhoto = [TrPhoto photo(:)];
    
end
% TrPhoto = double(TrPhoto);

for i = 1:length(testindex)
    
    photo   = imread([Path,Method,'/Photo/',num2str(testindex(i)),'.jpg']);
    if testindex(i) < 101
        photo = photo(28:227,24:178,:);
    else
        photo = photo(26:225,26:180,:);
    end
    photo   = rgb2gray(photo);
    TePhoto = [TePhoto photo(:)];
    
end
% TePhoto = double(TePhoto);

for i = 1:length(trainindex)
    
    sketch = imread([Path,Method,'/Sketch/',num2str(trainindex(i)),'.jpg']);
    if trainindex(i) < 101
        sketch = sketch(28:227,24:178,:);
    else
        sketch = sketch(26:225,26:180,:);
    end
    if size(sketch,3) == 3
        sketch = rgb2gray(sketch);
    end
    TrSketch = [TrSketch sketch(:)];
    
end
% TrSketch = double(TrSketch);

for i = 1:length(testindex)
    
    sketch = imread([Path,Method,'/Sketch/',num2str(testindex(i)),'.jpg']);
    if testindex(i) < 101
        sketch = sketch(28:227,24:178,:);
    else
        sketch = sketch(26:225,26:180,:);
    end
    if size(sketch,3) == 3
        sketch = rgb2gray(sketch);
    end
    TeSketch = [TeSketch sketch(:)];
    
end
% TeSketch = double(TeSketch);