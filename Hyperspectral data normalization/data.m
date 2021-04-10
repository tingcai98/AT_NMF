load Aviris_Moffet
[N_row,N_col,F] = size(im);
N = N_row*N_col;
V = reshape(im(:,:,:),N,F)';
% The data is noisy and contains a few negative values
% these values are arbitrarily thresholded
V(V<0) = 0;
% Removal of frequency bands with insignificant energy
mask = [1:4 104:115 151:175 205:222]; 
V(mask,:) = [];


% load Hyspex_Madonna
% [N_row,N_col,F] = size(im);
% N = N_row*N_col;
% V = double(reshape(im(:,:,:),N,F)');
