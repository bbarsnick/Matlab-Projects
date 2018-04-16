%% Proof for probability function
clear
load('RandSampProof.mat')
probability = [1 1 1 40];
population = (1:4); %sets array of students
sample_size = 1; %amount of students randomly choosen
rStudent = randsample(population, sample_size, true, probability);
disp(rStudent);
present = input('Is student "here"? 0-No 1-Yes ---->  '); %is student here
if present == 1 
    probability(rStudent) = probability(rStudent) - .25;
else
    probability(rStudent) = probability(rStudent) + .25;
end
disp(probability);
save('RandSampProof.mat','probability')