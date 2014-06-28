function ExecuteProposedDTW(varargin)
%% Input: MFCC feature vectors (Tidigits corpus/ Switchboard),metadata
% consisting of word type and speaker id, windowSize of DTW

%% check for inputs
 if length(varargin)==3
    MFCCDATA         =varargin{1};
    wordSpeakerIndex =varargin{2};
    windowSize       =varargin{3};
    k = 1;
    m = 0;
    time = 0;
    output = zeros(500*999,3);
    count = 1;
 else if length(varargin)==8
       MFCCDATA         =varargin{1};
       wordSpeakerIndex =varargin{2};
       windowSize       =varargin{3};
       k = varargin{4};
       m = varargin{5};
       time = varargin{6};
       output = varargin{7};
       count = varargin{8};
     end
 end
       
    
%% partition each  MFFC data sequences into sequence of frames of size windowSize
 MFCCDATA=PartitionMFCC(MFCCDATA,windowSize);

 tic;
 counter=1;

 for i =k :length(MFCCDATA)
    %% get MFCC vector,wordtype and speakerid 
    currentPattern = MFCCDATA{i};
    wordType = wordSpeakerIndex{i,1};
    speakerid = wordSpeakerIndex{i,2};
    
    if m>0
       z=m+1; 
    else
       z=i;
    end
    for j=z:length(MFCCDATA)
        %% get MFCC vector,wordtype and speakerid 
        pattern=MFCCDATA{j};
        wtype = wordSpeakerIndex{j,1};
        spid = wordSpeakerIndex{j,2};
      
        cost =ProposedDynamicTimeWarping(currentPattern,pattern,windowSize);
        % round cost to 5sf
        cost = round(cost/.00001)*0.00001;
        
        if abs(cost)==0
          cost =0;
        end
        %% store output
        output(count,1) = cost;
        output(count,2) = strcmp(wordType,wtype);
        output(count,3) = speakerid==spid;
        counter=counter+1;
        if (counter>500)
          filename=['RDTW_w' num2str(windowSize) '.txt'];
          dlmwrite(filename,output,'delimiter','\t');
          filestatus=['RDTW_w' num2str(windowSize) '.mat'];
          time=time+toc;
          tic;
          save (filestatus,'i','j','time');
          counter=1;
        end
        count=count+1;
    end
    if m>0
       m=0;
    end
 end
 filename=['RDTW_w' num2str(windowSize) '.txt'];
 dlmwrite(filename,output,'delimiter','\t');
 filestatus=['RDTW_w' num2str(windowSize) '.mat'];
 time=time+toc;
 save (filestatus,'time');


end
        