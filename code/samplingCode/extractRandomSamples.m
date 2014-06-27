%% This script is used to select 5000 random sampples from the extracted 
% segmented speech word files
load ../../dataset/data/SwitchBoard/MFCCSwitchBoard.mat
load ../../dataset/data/SwitchBoard/metadataSwitchboard.mat

MFCC_Samples =   cell(900,1);
metadata_sampled =  cell(1000,2);
metadata2_sampled = cell(1000,3);
sample_nums =zeros(1000,1);
rand('state',sum(100*clock));
for i=1:1000
    sample_Number = round(rand *11024);
    while (sum(sample_Number==sample_nums)>0)
          sample_Number = round(rand *11024);
    end
    sample_nums(i)=sample_Number;
    
    MFCC_Samples{i}= MFCCdata{sample_Number};
    
    metadata_sampled{i,1} = metadata{sample_Number,1};
    metadata_sampled{i,2} = metadata{sample_Number,2};
    
    metadata2_sampled{i,1} = metadata2{sample_Number,1};
    metadata2_sampled{i,2} = metadata2{sample_Number,2};
    metadata2_sampled{i,3} = metadata2{sample_Number,3};
    
end
save('metadataOfSampleddata.mat','metadata_sampled','metadata2_sampled');
save('MFCCOfsampleddata.mat','MFCC_Samples');