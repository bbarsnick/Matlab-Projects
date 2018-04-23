function callstudent( courseIdent, sample_size)
%callstudent calls a student randomly using a probability mass
%function thats adapts each time a student is called and changes their 
%probability of being called again depending if they are present or not
%Inputs
% courseIdent - class name specified in set up of class
% sample_size - amount of student to be called on at once
  if nargin < 1 || nargin > 2 %inputs can't be > 2 or < 1
      error('Out of input limits bro!')
  end
  if nargin < 2
      sample_size = 1; %default sample size is 1 unless inputted otherwise
  end
load('mech105.mat')%load previous probability sets
[~,n] = size(names); %determines amount of names
population = (1:n); %sets array of students

rStudent = randsample(population, sample_size, true, probability); %magic fn
if ismember(rStudent,blacklist) %check for student on blacklist
      while ismember(rStudent,blacklist) %if blacklister then skip
        rStudent = randsample(population, sample_size, true, probability);%run function again
        %for another student
      end
end
disp(names(rStudent)) %display student choosen
present = input('Is student "here"? 0-No 1-Yes ---->  '); %is student here
if present ~= 0 && present ~= 1
      fprintf('\n');
      disp('Skipping...'); %skip if anything else pressed
      fprintf('\n');
else
   calls(rStudent) = calls(rStudent) + 1; %add calls of student
end
if present == 1 
    probability(rStudent) = probability(rStudent) * .5; %if here lower probability by .25
    numCorrect(rStudent) = numCorrect(rStudent) + 1;%add a correct question
elseif present == 0
    probability(rStudent) = probability(rStudent) * 1.5;%if not here then raise
    %probability by .25
end
Min = min(probability); %calculates min of probability array
if Min <= 2*eps(1) %if min of probability is <= 2*machine epsilon then mult. probability by 10
    probability = 10*probability;
end

%disp(probability); %just to see how probability works
    save('mech105.mat','blacklist','calls','names','numCorrect','probability')
end

