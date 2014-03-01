function DATA = readTidigitsDATA()
DATA={};
speakersDigitIndex=cell(1467,1);
count=1;
%% path to tigits speech data
pathname ='/group/corpora/public/tidigits/tidigits/test/';

genderDir  = ls(pathname);
genders = strsplit(genderDir,' ');

for i=1:length(genders)
    pathtoSpecificGender = strcat(pathname, '/', genders(i));
    if iscellstr(pathtoSpecificGender)
        pathtoSpecificGender=pathtoSpecificGender{1};
    end
    %% setup path to each individual speaker files
    speakerDir = ls (pathtoSpecificGender);
    listofSpeakers = strsplit(speakerDir,' ');
    for j= 1:length(listofSpeakers)
        pathtoSpecificSpeaker = strcat(pathtoSpecificGender, '/', listofSpeakers(j));
        if iscellstr(pathtoSpecificSpeaker)
            pathtoSpecificSpeaker=pathtoSpecificSpeaker{1};
        end
        data ={'1','2','3','4','5','6','7','8','9'};
        for k=1:length(data)
           %% setup data path
           datapath = strcat(pathtoSpecificSpeaker, '/', data(k), 'a.wav');
           if iscellstr(datapath)
               datapath=datapath{1};
           end
           %%read data and conduct preprocessing : resampling followed by silence removal
           speechdata= readnist(datapath);
           DATA{count}= filterSignal(speechdata);
           speakersDigitIndex{count} ={listofSpeakers(j) , data(k)};
           count=count+1;
        end
    end
end
save('TidigitsRawdata.mat','DATA','speakersDigitIndex');
end
           
    