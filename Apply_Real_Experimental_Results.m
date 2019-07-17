load Real_Experimental_Results

% iPinPin-one
g_0 = 0.5;
i = 1;
alpha = 0.05;
[H(1), prob(1), stat(1)] = ipipi(SD,PD,g_0,i,alpha,1);

% iPinPin-homogenity
g_0 = 0.5;
i = 3;
alpha = 0.05;
[H(2), prob(2), stat(2)] = ipipi(SD,PD,g_0,i,alpha,1);

% iPinPin with i=3
g_0 = 0.5;
i = 3;
alpha = 0.05;
[H(3), prob(3), stat(3)] = ipipi(SD,PD,g_0,i,alpha,0);

% iPinPin with i=2
g_0 = 0.5;
i = 2;
alpha = 0.05;
[H(4), prob(4), stat(4)] = ipipi(SD,PD,g_0,i,alpha,0);

H
prob


% you may obtain the following results, which indicates that except iPinPin-one,
% we obtain sigificant resutls from the current experiment.
%  H = [0 1 1 1];
% prob = [0.1126 0.0239 0.0239 0.0089]
% 
