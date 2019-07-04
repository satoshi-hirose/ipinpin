gamma_0 = 0.5;
alpha = 0.05;

prob_low = 0.1;
high = 100;
low = 30;
P_a1_null_high = binocdf(high,100,.5,'upper');
P_a1_null_low = binocdf(low,100,.5,'upper');

% null follows binopdf

for N = 5:50
disp(N)
%% probability of significant results with i = 1
i = 1;

% no participant is outlier
% thus, acc is high 
prob1 = binocdf(i-1,N,prob_low);

P_a1_null = P_a1_null_high;
Q_n = (1-gamma_0)*P_a1_null+gamma_0;
L1 = binocdf(i-1,N,1-Q_n);
H1 = (L1 < alpha);

% one or more participant is ourlier
% thus, acc is low outlier
prob2 = 1-prob1;

P_a1_null = P_a1_null_low;
Q_n = (1-gamma_0)*P_a1_null+gamma_0;
L2 = binocdf(i-1,N,1-Q_n);
H2 = (L2 < alpha);

P_sig(1,N) = prob1*H1 + prob2*H2;


%% calculate maximum i
prob_min = 0;
i=0;
while prob_min < alpha
i=i+1;previous_prob_min = prob_min;
prob_min =  binocdf(i-1,N,(1-gamma_0));
end
prob_min = previous_prob_min;
i=i-1;

% less than i participant is outlier
% thus, acc is high 
prob1 = binocdf(i-1,N,prob_low);

P_a1_null = P_a1_null_high;
Q_n = (1-gamma_0)*P_a1_null+gamma_0;
L1 = binocdf(i-1,N,1-Q_n);
H1 = (L1 < 0.05);

% one or more participant is ourlier
% thus, acc is low outlier
prob2 = 1-prob1;
P_a1_null = P_a1_null_low;
Q_n = (1-gamma_0)*P_a1_null+gamma_0;
L2 = binocdf(i-1,N,1-Q_n);
H2 = (L2 < 0.05);

P_sig(2,N) = prob1*H1 + prob2*H2;

i_max(N)  = i;

end
figure; plot(P_sig'); hold on
temp_x = find(diff(i_max))+0.5;
temp_y = axis;
temp_y = temp_y([3 4]);
for i = 1:length(temp_x)
plot([temp_x(i) temp_x(i)],temp_y,'k--')
end



