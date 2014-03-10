load ../data/TidigitsWithSilR/MFCCTIDIGITS.mat
load ../data/TidigitsWithSilR/TidigitsData.mat
ExecuteDTW(MFCCdata,speakersDigitIndex,0.1);
ExecuteDTW(MFCCdata,speakersDigitIndex,0.2);
ExecuteDTW(MFCCdata,speakersDigitIndex,0.3);