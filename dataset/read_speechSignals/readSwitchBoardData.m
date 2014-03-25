function readSwitchBoardData(metadata)
%% input metadata is k by 3 cell array where each cell contains information about 
%1) fileid, 2) start time of the word  and 3) end time of the word in the signal
%%
[numOfSamples, num_meta] =size(metadata);
rawSamples = cell(numOfSamples,1);

for i=1 : numOfSamples
    fileid = metadata{i,1};
    filename= strcat('sw0',fileid,'.sph');
    filepath = strcat('/group/corpora/large/switchboard/switchboard1/swb1/',filename);
    %% read speech file
    rawSpeechSignal =readsph(fileapath);
    %% considering only the first channel
    rawSpeechSignal= rawSpeechSignal(:,1);
    %% extracting the appropriate word from the signal using the start and end times
    rawSamples{i} = rawSpeechSignal(metadata{i,2}*8000: metadata{i,3}*8000);
end

save('RawSwitchBoardWordSamples.mat','rawSamples');