function Q = ScootMeasure(sketch,synthesis)

% ScootMeasure computes the similarity between
% the sketch and synthesis image
% (as proposed in our paper: [Fan et.al -  arXiv:1804.02975])
% https://arxiv.org/abs/1804.02975
%
% Input:
%   sketch: sketch photo
%   synthesis: the synthesis corresponding to the original photo
% Output:
%   Q: the style similarity score
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if max(synthesis(:)) == min(synthesis(:)) || max(sketch(:)) == min(sketch(:))
    error('the input is illegal');
end



if (~isa(synthesis, 'uint8'))
    synthesis = im2uint8(synthesis);
end

if (~isa(sketch, 'uint8'))
    sketch = im2uint8(sketch);
end

if length(size(sketch)) == 3
    sketch = rgb2gray(sketch);
end

if length(size(synthesis)) == 3
    synthesis = rgb2gray(synthesis);
end

syn = []; GT = [];

N_blocks = 4; % We divide the image into (default = 4) blocks.

sketch_batch = {};
syn_batch = {};
v = 0:N_blocks;
x_dim = floor(size(sketch,1)*v/N_blocks);
y_dim = floor(size(sketch,2)*v/N_blocks);

for i = 1:N_blocks
    for j = 1:N_blocks
        sketch_batch{i*N_blocks+j-N_blocks} = sketch(x_dim(i)+1:x_dim(i+1),y_dim(j)+1:y_dim(j+1));
        syn_batch{i*N_blocks+j-N_blocks} = synthesis(x_dim(i)+1:x_dim(i+1),y_dim(j)+1:y_dim(j+1));
    end
end
for i = 1:N_blocks*N_blocks
    [tmp_GT, tmp_syn] = coMatrix(sketch_batch{i},syn_batch{i});
    syn = [syn tmp_syn];
    GT = [GT tmp_GT];
end

Q = 1 / (1 + norm(GT-syn,2));
    
end


function [GT,syn] = coMatrix(sketch,synthesis)
    
    offsets = [0 1;-1 1;-1 0;-1 -1]; % default: 4 orientations
    
    GT_GLCMS = graycomatrix(sketch,'OF',offsets,'NumLevels',6); % quantization level set 6
    GT_glcms = round(mean(GT_GLCMS,3)); % average the 4 orientations statistics
    GT_stats = graycoprops(GT_glcms,{'Contrast','Energy'}); % GLCMS based on two statistics: contrast and energy
    
    GT(1) = GT_stats.Contrast;
    GT(2) = GT_stats.Energy;
    
    
    syn_GLCMS = graycomatrix(synthesis,'OF',offsets,'NumLevels',6);
    syn_glcms = round(mean(syn_GLCMS,3));
    syn_stats = graycoprops(syn_glcms,{'Contrast','Energy'});
    
    syn(1) = syn_stats.Contrast;
    syn(2) = syn_stats.Energy;
    
    
    
end


