function optimumCost = DynamicTimeWarping(varargin)
%%The DTW algorithm using a symmetric weighting function to ensure D(A,B)=D(B,A)

if length(varargin)<2
    error('input:arg','The DTW arguments needs to be two patterns')
end

%%window parameter locality constaint
window =0;
if length(varargin)==3
    window =varargin{3};
end

%% input patterns
patternA =varargin{1};
patternB = varargin{2};

windowSize = max(ceil(window*(max(size(patternA,2),size(patternB,2)))),abs(size(patternA,2)-size(patternB,2)));

%% initializing the DTW cost matrix
DTW = zeros(size(patternA,2)+1,size(patternB,2)+1);
for i=2:length(patternA)
   DTW(i,1)=Inf;
end
for j=2:length(patternB)
    DTW(1,j)=Inf;
end

%% augmenting patterns with a vector of zeros
patternA = [zeros(size(patternA,1),1) patternA];
patternB = [zeros(size(patternB,1),1) patternB];
patternANum = size(patternA,2);
patternBNum= size(patternB,2);

for i=2:patternANum
    for j=2:patternBNum
        if (length(varargin)==3 && abs(i-j)>windowSize)
            %%force all warping paths to go through the window
            DTW(i,j)=Inf;
            continue;
        end
        %%cosine distance
        cost = acos(sum(patternA(:,i).*patternB(:,j))/(sqrt(sum(patternA(:,i).^2))*sqrt(sum(patternB(:,j).^2))))/pi;
        DTW(i,j)  = min([(DTW(i,j-1)+cost) (DTW(i-1,j-1)+2*cost) (DTW(i-1,j)+cost)]);
    end
end

optimumCost = DTW(patternANum,patternBNum)/(patternANum+patternBNum-2);










end