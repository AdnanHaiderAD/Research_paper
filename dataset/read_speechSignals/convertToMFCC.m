function MFCCdata = convertToMFCC(RawData)
%% assuming that we are in ~/Research_paper/dataset/read_speechSignals/ directory
addpath('MFCC/');
numberofSamples =length(RawData);
MFCCdata =cell(numberofSamples,1);

for i=1: numberofSamples
    MFCCdata{i} = melfcc(resample(RawData{i},1,2));
end
save('MFCCTIDIGITS.mat','MFCCdata');
end

