function optimumCost = DynamicTimeWarping(vargin)
%%The DTW algorithm using a symmetric weighting function
if length(vargin)<2
    error('input:arg','The DTW arguments needs to be two patterns')
end
%%window parameter locality constaint
windowSize =0;
if length(vargin)==3
    windowSize =vargin(3);
end

%% input patterns
patternA =vargin(1)
patternB = vargin(2);
window = max(ceil(windowSize*(max(length(patternA),length(patternB)))),abs(length(patternA)-length(patternB)));

optimimCost =Inf;





end