function optimumCost =  ProposedDynamicTimeWarping(patternA,patternB,WindowSize)

extracell ={zeros(size(patternA,1),1)};
patternA ={extracell{:} patternA{:}};
patternB ={extracell{:} patternB{:}};


%% initializing the DTW cost matrix
DTW = zeros(length(patternA)+1,length(patternB)+1);

for i=2:length(patternA)
   DTW(i,1)=Inf;
end
for j=2:length(patternB)
    DTW(1,j)=Inf;
end


for i=2:length(patternA)
    for j=2:length(patternB)
        frameA= patternA{i};
        frameB =patternB{j};
        %%proposed cost metric 
        cost = 1-(real(acos(sum(sum(frameA,2).*sum(frameB,2))/(norm(sum(frameA,2))*norm(sum(frameB,2))))))/pi;
        DTW(i,j)  = min([(DTW(i,j-1)+cost) (DTW(i-1,j-1)+2*cost) (DTW(i-1,j)+cost)]);
    end
end

optimumCost =DTW(length(patternA),length(patternB))/(length(patternA)+length(patternB)-2);
