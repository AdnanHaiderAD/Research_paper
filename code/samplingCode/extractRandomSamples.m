%% This script is used to select 5000 random sampples from the extracted 
% segmented speech word files
load ../../dataset/data/SwitchBoard/MFCCSwitchBoard.mat
load ../../dataset/data/SwitchBoard/metadataSwitchboard.mat

MFCC_Samples =   cell(5000,1);
metadata_sampled =  cell(5000,2);
metadata2_sampled = cell(5000,3);
for i=1:5000
    sample_Number = round(rand *11024);
    
    MFCC_Samples{i}= MFCCdata{sample_Number};
    
    metadata_sampled{i,1} = metadata{i,1};
    metadata_sampled{i,2} = metadata{i,2};
    
    metadata2_sampled{i,1} = metadata2{i,1};
    metadata2_sampled{i,2} = metadata2{i,2};
    metadata2_sampled{i,3} = metadata2{i,3};
    
end
save('metadataOfSampleddata.mat','metadata_sampled','metadata2_sampled');
save('MFCCOfsampleddata.mat','MFCC_Samples');