clear all
close all
clc
%% Set the training and testing path
train_path = 'E:\Matlab project\P1\FingerPrint _last2\database2\train';
test_path = 'E:\Matlab project\P1\FingerPrint _last2\database2\test\110_1.tif';
labels={'person1','person1','person1','person1','person1','person1','person1','person1',...
    'person2','person2','person2','person2','person2','person2','person2','person2',...
    'person3','person3','person3','person3','person3','person3','person3','person3',...
    'person4','person4','person4','person4','person4','person4','person4','person4',...
    'person5','person5','person5','person5','person5','person5','person5','person5',...
    'person6','person6','person6','person6','person6','person6','person6','person6'...
    'person7','person7','person7','person7','person7','person7','person7','person7'...
    'person8','person8','person8','person8','person8','person8','person8','person8'...
    'person9','person9','person9','person9','person9','person9','person9','person9'...
    'person10','person10','person10','person10','person10','person10','person10','person10' };
decomposition_level=1;
resize_factor = 150;
threshold_value = 1.0*(10^(+2)); 
training_feature_vector = train(train_path,decomposition_level,resize_factor);
decision = test(test_path, decomposition_level,training_feature_vector,labels, threshold_value,resize_factor);
disp(decision);
%% 
%classificationLearner
%%
%[dp,c] = dprime(0.99,0.01) 