function [metadata, metadata2] = extractMetadata(wordlistText)
%% metadata is k by 2 column matrix containing information about word type and speaker id; metatdata2 is a k by 3
% column matrix containing information about 1) filename of the speech
% file, the start and end times of the spoken word in the speech file.
%%
wordlist = textread(wordlistText,'%s','delimiter','\t');
metadata= cell(length(wordlist),2);
metadata2= cell(length(wordlist),3);

%%iterate over the textfile and extract metadata : word_type, filename,
%%speaker id , start and end times
for i =1 : length(wordlist)
    list = wordlist{i};
    metainfo = strsplit(list);
    
    %% collect information of word_type and speaker id
    metadata{i,1}=metainfo{1};
    metadata{i,2} = str2double(metainfo{4});
    
    %% collect information of file id, start and end time of the word in the file
    fileinfo=metainfo{3};
    if fileinfo(end)=='A'
        f = fileinfo~='A';
        fileid =fileinfo(f);
    else
         f = fileinfo~='B';
         fileid =fileinfo(f);
    end
    metadata2{i,1}= fileid;
    metadata2{i,2}= str2double(metainfo{5})/100;
    metadata2{i,3} = str2double(metainfo{5})/100;
    
end

save('metadataSwitchboard.mat','metadata','metadata2');
end

