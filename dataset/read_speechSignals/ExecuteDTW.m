function ExecuteDTW(MFCCDATA,SpeakersDigitsIndex, windowSize)
%%Runs the DTW/Adaptive DTW algorithm to find the most similar distinct
%%speech pattern for each pattern in the test data set of TIDIGITS 
costMatrix=zeros(length(MFCCDATA),length(MFCCDATA));
output= zeros(length(MFCCDATA),3);
for i =1 : length(MFCCDATA)
    currentPattern =MFCCDATA{i};
    metaData =SpeakersDigitsIndex{i};
    speakerid =metaData{1};
    digitclass =metaData{2};
    
    min_cost=Inf;
    id_closestspeaker='';
    id_closestClass='';
    for j=1:length(MFCCDATA)
        pattern=MFCCDATA{j}; 
        meta =SpeakersDigitsIndex{j};
        spid =meta{1};
        dclass=meta{2};
        if (j<i)
            cost =costMatrix(j,i);
            
        else
            cost= DynamicTimeWarping(currentPattern,pattern,windowSize);
        end
        if (cost <min_cost) 
             min_cost=cost;
             id_closestspeaker=spid;
             id_closestClass=dclass;
             costMatrix(i,j)=cost;
        end
    end
    output(i,1)=min_cost;
    output(i,2)= strcmp(speakerid,id_closestspeaker);
    output(i,3) =strcmp(digitclass,id_closestClass);
end
save ('RDTW_w0.1.mat',output);
end
        
        