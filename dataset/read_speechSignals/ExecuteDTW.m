function ExecuteDTW(MFCCDATA,SpeakersDigitsIndex, windowSize)
%%Input: Dataset (Tidigits corpus/ Switchboard), windowSize
% Applies DTW algorithm to group together similar patterns
tic;
%%number of comparisons: N choose 2
numberofComparisons= factorial(length(MFCCDATA))/(factorial(2)*factorial(length(MFCCDATA)-2));
%%output= zeros(numberofComparisons,3);

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
    end    
    output(count,1)=DynamicTimeWarping(currentPattern,pattern,windowSize);
    output(count,2)= strcmp(speakerid,spid);
    output(count,3) =strcmp(digitclass,dclass);
    count=count+1;
    
end
time=toc;
filename=['RDTW_w' num2str(windowSize) '.mat'];
save (filename,'output','time');
end
        
        