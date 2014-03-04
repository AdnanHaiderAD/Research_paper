load ../data/TidigitsWithoutSil/MFCCTIDIGITS.mat
load ../data/TidigitsWithoutSil/TidigitsRawdata.mat
ExecuteProposedDTW(MFCCdata,speakersDigitIndex,2);
ExecuteProposedDTW(MFCCdata,speakersDigitIndex,3);
ExecuteProposedDTW(MFCCdata,speakersDigitIndex,5);