clear all
close all
clc
%% Load image data
imds=imageDatastore ('E:\Matlab project\P1\FingerPrint _last2\database',...
'IncludeSubfolders', true,'LabelSource','foldernames');
%% Display Class Names and Counts
tbl = countEachLabel (imds)
categories = tbl.Label;
%% Display Sampling of Image Data
figure
numImages = 80;
perm = randperm(numImages,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
    drawnow;
end

%% spliting data
[training_set, test_set] = prepareInputFiles(imds);
%% Create Visual Vocabulary 
tic
bag = bagOfFeatures(training_set,'VocabularySize',200,'PointSelection','Detector');
Fpdata = double(encode(bag, training_set));   %encodes MSG using an error-control coding technique
                                              %Convert symbolic values to double precision
toc
return;
%% Create a Table using the encoded features
FPImageData = array2table(Fpdata);
Type = categorical(repelem({training_set.Description}', [training_set.Count], 1)); %Create a vector and repeat each of its elements N times into a new vector.
FPImageData.Type = Type;
%% Use the new features to train a model and assess its performance  
classificationLearner
%% Test out accuracy on test set!
%it gives low accuracy so we replace it
testFpData = double(encode(bag, test_set));
testFpData = array2table(testFpData,'VariableNames',knnModel.RequiredVariables);
actualFpType = categorical(repelem({test_set.Description}', [test_set.Count], 1));
predictedOutcome = knnModel.predictFcn(testFpData);
correctPredictions = (predictedOutcome == actualFpType);
validationAccuracy = sum(correctPredictions)/length(predictedOutcome) 
%% Test matching and checking out accuracy on test set!
testFpData = double(encode(bag, test_set));
testFpData = array2table(testFpData,'VariableNames',svmModel.RequiredVariables);
actualFpType = categorical(repelem({test_set.Description}', [test_set.Count], 1));
predictedOutcome = svmModel.predictFcn(testFpData);
correctPredictions = (predictedOutcome == actualFpType);
validationAccuracy = sum(correctPredictions)/length(predictedOutcome)
%%
[dp,c] = dprime(0.86,0.14) 