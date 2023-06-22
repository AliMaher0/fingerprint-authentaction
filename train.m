function [training_feature_vectors] = train(train_path,decomposition_level,resize_factor)
 
training_feature_vectors=[];
imagefiles = dir(fullfile(train_path,'*.tif')); 
    for i=1:size(imagefiles,1)
        train_img=imread(fullfile(train_path,imagefiles(i).name));
%      preprocessing  
        train_img=im2double(train_img); 
        train_img=imbinarize(train_img);
        train_img=imresize(train_img,[resize_factor resize_factor]);
        %
        train_feature_vector = get_wavelet_features(train_img, decomposition_level);
        training_feature_vectors=[training_feature_vectors,train_feature_vector];
    end
end
