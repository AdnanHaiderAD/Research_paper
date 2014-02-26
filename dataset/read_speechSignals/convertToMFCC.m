function MFCCdata = convertToMFCC(RawData)
%% assuming that we are in ~/Research_paper/dataset/read_speechSignals/ directory
addpath('MFCC/');
numberofSamples =length(RawData);
MFCCdata =cell(numberofSamples,1);

for i=1: numberofSamples
    MFCCdata{i} = melfcc(RawData{i},10000);
end
save('MFCCTIDIGITS.mat','MFCCdata');
end

