function Result = Eigenface(TrainData,TestData,GalleryData,TestLabel,GalleryLabel,Maxdim,method)

counter  = 1;
accuracy = 0;

TrainData = double(TrainData);
TestData  = double(TestData);
GalleryData = double(GalleryData);

for ndim = 1:Maxdim
    
    if mod(ndim, 100) == 0
        fprintf('%s, Eigenface, ndim=%d, the best accuracy is %f\n', method, ndim, accuracy);
    end
    
    options.ReducedDim = ndim;
    
    [EVec EVal] = PCA(TrainData',options);
    
    ProjTest    = EVec'*TestData;
    ProjGallery = EVec'*GalleryData;
    
    Distance = EuDist2(ProjTest',ProjGallery');
    [distance index] = sort(Distance');
    
    PredictLabel = GalleryLabel(index(1,:)');
    
    rate = sum(PredictLabel == TestLabel)/length(TestLabel);
    
    RecRate(counter) = rate;
    counter = counter + 1;
    
    if rate > accuracy
        
        accuracy = rate;
        feadim   = ndim;
        Basis    = EVec;
        
    end
    
end

% figure;
% plot([1:Maxdim],RecRate);
% hold on;
% plot([1:Maxdim],RecRate,'r*');

Result.RecRate  = RecRate;
Result.accuracy = accuracy;
Result.feadim   = feadim;
Result.Basis    = EVec;