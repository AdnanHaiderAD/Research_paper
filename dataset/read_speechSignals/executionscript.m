load ../data/SwitchBoard/MFCCSwitchBoard.mat
load ../data/SwitchBoard/metadataSwitchboard.mat
ExecuteDTW(MFCCdata,metadata,0.1,378,5206,17920);
ExecuteDTW(MFCCdata,metadata,0.2);
ExecuteDTW(MFCCdata,metadata,0.3);