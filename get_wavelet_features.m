function [wavelet_feature_vector] = get_wavelet_features(image,decomposition_level)
 
[Lo_D,Hi_D] = wfilters('haar','d');
 
for i=1:decomposition_level
    [image, ~, ~, ~]=dwt2(image,Lo_D,Hi_D); %Single-level discrete 2-D wavelet transform
end
wavelet_feature_vector = image(:);
 
end
