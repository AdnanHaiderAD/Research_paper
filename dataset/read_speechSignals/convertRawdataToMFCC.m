function MFCCDATA = convertRawdataToMFCC(DATA)
%% converts raw speech signal to their appropriate MFCC representation

MFCCDATA = cell (length(DATA),1);
for i=1:length(DATA)
MFCCDATA{i} =mffc(DATA{i});
end

end



