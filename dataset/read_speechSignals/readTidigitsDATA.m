function DATA = readTidigitsDATA()
DATA={};
count=1;
%% path to tigits speech data
pathname ='/group/corpora/public/tidigits/tidigits/test/';

genderDir  = ls(pathname);
genders = strsplit(genderDir,' ');

for i=1:length(genders)
    pathtoSpecificGender = [pathname '/' genders(i)];
    
    %% setup path to each individual speaker files
    speakerDir = ls (pathtoSpecificGender);
    listofSpeakers = strsplit(speakerDir,' ');
    for j= 1:listofSpeakers
        pathtoSpecificSpeaker = [pathtoSpecificGender '/' listofSpeakers(j)];
        data ={'1','2','3','4','5','6','7','8','9'};
        for k=1:length(data)
           %% setup data path
           datapath = [pathtoSpecificSpeaker '/' data(k) 'a.wav'];
           
           %%read data and conduct preprocessing : resampling followed by silence removal
           speechdata= readnist(datapath);
           DATA{count}= filterSignal(speechdata);
           count=count+1;
        end
    end
end
end
           
    