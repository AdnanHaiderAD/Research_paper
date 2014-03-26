function ExecuteDTW(mFCCDATA,wordSpeakerIndex, windowSize)
%%Input: Dataset (Tidigits corpus/ Switchboard), windowSize
% Applies DTW algorithm to group together similar patterns where the number  of comparisons is N choose 2

%% output : a text file of 3 fields : DTW distance and two binary digits denoting speakerid= speaker2id 
%and whether the two patterns belong to the same word type. 

tic;
output=[];
time=0;
count=1;
for i =1 :length(mFCCDATA)
    currentPattern =mFCCDATA{i};
    %%  tidigits data
    %metaData =wordSpeakerIndex{i};
    %%speakerid =metaData{1};
    %digitclass =metaData{2};
    %%
    
    %% switchboard corpus
    wordType = wordSpeakerIndex{i,1};
    speakerid = wordSpeakerIndex{i,2};
    %%
    
    for j=i:length(mFCCDATA)
        pattern=mFCCDATA{j};
       
        %%  tidigits data
        %meta =SpeakersDigitsIndex{j};
        %spid =meta{1};
        %dclass=meta{2};
        
        %% switchboard data
        wtype = wordSpeakerIndex{j,1};
        spid = wordSpeakerIndex{j,2};
        %%
       
        cost =DynamicTimeWarping(currentPattern,pattern,windowSize);
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
            count=0;
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
        
        