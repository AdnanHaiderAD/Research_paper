function ExecuteProposedDTW(MFCCDATA,wordSpeakerIndex, windowSize)
%%Input: Dataset (Tidigits corpus/ Switchboard), windowSize
% Applies DTW algorithm to group together similar patterns

%%partition each  MFFC data sequences into sequence of frames of size windowSize
MFCCDATA=PartitionMFCC(MFCCDATA,windowSize);

tic;
output=[];
time=0;
count=1;
for i =1 :length(MFCCDATA)
    %%  tidigits data
    %metaData =wordSpeakerIndex{i};
    %%speakerid =metaData{1};
    %digitclass =metaData{2};
    %%
    
    %% switchboard corpus
    currentPattern = MFCCDATA{i};
    wordType = wordSpeakerIndex{i,1};
    speakerid = wordSpeakerIndex{i,2};
    %%
    
   
    for j=i:length(MFCCDATA)
        pattern=MFCCDATA{j};
        %%  tidigits data
        %meta =SpeakersDigitsIndex{j};
        %spid =meta{1};
        %dclass=meta{2};
        
        %% switchboard data
        wtype = wordSpeakerIndex{j,1};
        spid = wordSpeakerIndex{j,2};
        %%
       
        cost =ProposedDynamicTimeWarping(currentPattern,pattern,windowSize);
         %% round cost to 5sf
        cost = round(cost/.00001)*0.00001;
        if abs(cost)==0
            cost =0;
        end
        output(count,1)=cost;
        output(count,2)= speakerid==spid;
        output(count,3) =strcmp(wordType,wtype);
        if (count>10000)
            filename=['RDTW_w' num2str(windowSize) '.txt'];
            dlmwrite(filename,output,'-append','delimiter','\t');
            count=1;
            output=[];
            filestatus=['RDTW_w' num2str(windowSize) '.mat'];
            time=time+toc;
            tic;
            save (filestatus,'i','j','time');
        end
        count=count+1;
        
    end
end
filename=['RDTW_w' num2str(windowSize) '.txt'];
dlmwrite(filename,output,'-append','delimiter','\t');
filestatus=['RDTW_w' num2str(windowSize) '.mat'];
time=time+toc;
save (filestatus,'time');


end
        