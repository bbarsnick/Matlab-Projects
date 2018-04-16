%% Initialize variables to create class - Mech105
blacklist = [0];
names = names2;
calls = zeros(size(names));
numCorrect = zeros(size(names));
mech105 = 'mech105.mat';
[~,n] = size(names);
probability = ones(1,n); %sets probability of each student to 1
save('mech105.mat','blacklist','calls','names','numCorrect','probability')