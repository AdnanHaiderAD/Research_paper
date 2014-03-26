load ../data/SwitchBoard/MFCCSwitchBoard.mat
load ../data/SwitchBoard/metadataSwitchboard.mat
ExecuteDTW(MFCCdata,metadata,0.1);
ExecuteDTW(MFCCdata,metadata,0.2);
ExecuteDTW(MFCCdata,metadata,0.3);