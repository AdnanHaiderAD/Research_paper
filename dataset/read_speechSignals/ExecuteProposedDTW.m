function ExecuteProposedDTW(MFCCDATA,SpeakersDigitsIndex, windowSize)
%%Input: Dataset (Tidigits corpus/ Switchboard), windowSize
% Applies DTW algorithm to group together similar patterns

%%partition each  MFFC data sequences into sequence of frames of size windowSize
MFCCDATA=PartitionMFCC(MFCCDATA,windowSize);

tic;
output=[];
time=0;
count=1;
for i =1 :length(MFCCDATA)
    currentPattern =MFCCDATA{i};
    metaData =SpeakersDigitsIndex{i};
    speakerid =metaData{1};
    digitclass =metaData{2};
    for j=i+1:length(MFCCDATA)
        pattern=MFCCDATA{j};
        meta =SpeakersDigitsIndex{j};
        spid =meta{1};
        dclass=meta{2};
        output(count,1)=ProposedDynamicTimeWarping(currentPattern,pattern,windowSize);
        output(count,2)= strcmp(speakerid,spid);
        output(count,3) =strcmp(digitclass,dclass);
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
        