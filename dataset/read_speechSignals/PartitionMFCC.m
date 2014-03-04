function MFCCDATAP =PartitionMFCC(MFCCDATA,WindowSize)
%%partition a sequence of MFCC vector into frames of size WindowSize

MFCCDATAP=cell(length(MFCCDATA),1);
for i=1:length(MFCCDATAP)
    pattern =MFCCDATA{i};
    
    %%partitioning the MFCC vectors into sets of width WindowSize
    lengthOfpattern= size(pattern,2);
    numberOfFrames = floor(lengthOfpattern/WindowSize);
    remaincols =(lengthOfpattern -numberOfFrames*WindowSize);
   
    if (remaincols>0) 
        MFCCDATAP{i} =mat2cell(pattern,size(pattern,1),[(ones(1,numberOfFrames)*WindowSize) remaincols]);
    else
        MFCCDATAP{i} =mat2cell(pattern,size(pattern,1),ones(1,numberOfFrames)*WindowSize);
    end
end
end
