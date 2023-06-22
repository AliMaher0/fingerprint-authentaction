  function [label] = test(test_img_path, decomposition_level,training_feature_vector,labels, threshold_value,resize_factor)
 
test_img=imread(test_img_path);
test_img=im2double(test_img); 
%test_img=rgb2gray(test_img);
test_img=imresize(test_img,[resize_factor resize_factor]);
imshow(test_img);
test_feature_vector = get_wavelet_features(test_img,decomposition_level);
score=zeros(size(training_feature_vector,2),1);
for i=1:size(training_feature_vector,2)
 score(i) = sqrt(sum((test_feature_vector - training_feature_vector(:,i)).^2));
end
[M,I] = min(score);
if M <= threshold_value
    label = labels(I);
else
    label = "No match found";
end

end  
