load ../data/SwitchBoard/MFCCSwitchBoard.mat
load ../data/SwitchBoard/metadataSwitchboard.mat
ExecuteProposedDTW(MFCCdata,metadata,2,410,5030,17869);
ExecuteProposedDTW(MFCCdata,metadata,3);
ExecuteProposedDTW(MFCCdata,metadata,5);