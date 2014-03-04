function optimumCost =  ProposedDynamicTimeWarping(patternA,patternB,WindowSize)

% %% segmenting the sequence of MFCC vectors further into frames of length WindowSize
% lengthOfPatternA = size(patternA,2);
% lengthOfPatternB = size(patternB,2);
% 
% numberOfFramesA = floor(lengthOfPatternA/WindowSize);
% numberOfFramesB =floor(lengthOfPatternB/WindowSize);
% 
 extracell ={zeros(size(patternA,1),1)};
% 
% %%partitioning the MFCC vectors into sets of width WindowSize
% remaincolsA =(lengthOfPatternA -numberOfFramesA*WindowSize);
% if (remaincolsA>0) 
%     patternA =mat2cell(patternA,size(patternA,1),[(ones(1,numberOfFramesA)*WindowSize) remaincolsA]);
% else
%     patternA =mat2cell(patternA,size(patternA,1),[ones(1,numberOfFramesA)*WindowSize]);
% end
% remaincolsB =(lengthOfPatternB -numberOfFramesB*WindowSize);
% if (remaincolsB>0)
%     patternB =mat2cell(patternB,size(patternB,1),[(ones(1,numberOfFramesB)*WindowSize) remaincolsB]);
% else
%     patternB =mat2cell(patternB,size(patternB,1),[ones(1,numberOfFramesB)*WindowSize]);
% end

%% augmenting patterns with a vector of zeros
patternA ={extracell{:} patternA{:}};
patternB ={extracell{:} patternB{:}};


%% initializing the DTW cost matrix
DTW = zeros(length(patternA)+1,length(patternB)+1);
for i=2:length(patternA)
   DTW(i,1)=Inf;
end
for j=2:length(patternB)
    DTW(1,j)=Inf;
end


for i=2:length(patternA)
    for j=2:length(patternB)
        frameA= patternA{i};
        frameB =patternB{j};
        %%proposed cost metric
        cost = real(acos(sum(sum(frameA,2).*sum(frameB,2))/(norm(sum(frameA,2))*norm(sum(frameB,2)))));
        DTW(i,j)  = min([(DTW(i,j-1)+cost) (DTW(i-1,j-1)+2*cost) (DTW(i-1,j)+cost)]);
    end
end

optimumCost =DTW(length(patternA),length(patternB))/(length(patternA)+length(patternB)-2);
