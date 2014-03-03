function ExecuteDTW(MFCCDATA,SpeakersDigitsIndex, windowSize)
%%Input: Dataset (Tidigits corpus/ Switchboard), windowSize
% Applies DTW algorithm to group together similar patterns
tic;
costMatrix=zeros(length(MFCCDATA),length(MFCCDATA));
%%output= zeros(length(MFCCDATA),3);
output =zeros(10,3);
count=1;

for i =1 : length(MFCCDATA)
    currentPattern =MFCCDATA{i};
    metaData =SpeakersDigitsIndex{i};
    speakerid =metaData{1};
    digitclass =metaData{2};
    
    min_cost=Inf;
    id_closestspeaker='';
    id_closestClass='';
    for j=1:length(MFCCDATA)
        if(i==j)
            continue;
        end
        pattern=MFCCDATA{j};
        meta =SpeakersDigitsIndex{j};
        spid =meta{1};
        dclass=meta{2};
        if (j<i)
            cost =costMatrix(j,i);
            
        else
            cost= DynamicTimeWarping(currentPattern,pattern,windowSize);
            costMatrix(i,j)=cost;
        end
        if (cost <min_cost) 
             min_cost=cost;
             id_closestspeaker=spid;
             id_closestClass=dclass;
        end
    end
    
    output(i,1)=min_cost;
    output(i,2)= strcmp(speakerid,id_closestspeaker);
    output(i,3) =strcmp(digitclass,id_closestClass);
    count=count+1;
    
end
time=toc;
filename=['RDTW_w' num2str(windowSize) '.mat'];
save (filename,'output','time');
end
        
        