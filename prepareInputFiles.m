function [tr_set,test_set] = prepareInputFiles(dsObj)
% as bagOfFeatures still requires an imageSet object to run. This
% is on the roadmap to change in the future, but for now, we need to
% convert this to an imageSet object! 
image_location = fileparts(dsObj.Files{1});
imset = imageSet(strcat(image_location,'\..'),'recursive');
[tr_set,test_set] = imset.partition(64);
tr_set = tr_set.partition(64);
test_set = test_set.partition(16);
end