load ../data/TidigitsWithoutSil/MFCCTIDIGITS.mat
load ../data/TidigitsWithoutSil/TidigitsRawdata.mat
ExecuteDTW(MFCCdata,speakersDigitIndex,0.1);
ExecuteDTW(MFCCdata,speakersDigitIndex,0.2);
ExecuteDTW(MFCCdata,speakersDigitIndex,0.3);