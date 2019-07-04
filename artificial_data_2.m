gamma_0 = 0.5;
alpha = 0.05;

high = 90;
lowp = binopdf(0:100,100,.5);
low = 0:100;

gamma_ind = 0;
for gamma = 0:0.01:1
    disp(gamma)
    gamma_ind=gamma_ind+1;
    
    N_ind = 0;
for N = [5 10 30 50 100]
    N_ind=N_ind+1;
%% i is 1
i = 1; 
% pdf of number of omega_plus participant
n_g_plus   = 0:N;
n_g_plusp  = binopdf(n_g_plus,N,gamma);
ii = 0;
clear p_of_sig
for this_n_g_plus = n_g_plus
    ii=ii+1;
    this_n_g_minus = N - this_n_g_plus;
    if this_n_g_minus < i
        p_of_sig(ii) = 1;
    else
        ostat_cdf = 1-binocdf(0:100,100,.5,'upper').^this_n_g_minus;
        ostatp     = [ostat_cdf(1), diff(ostat_cdf)];
                                ostat = 0:100;
        
        P_a1_null = binocdf(ostat,100,.5,'upper');
        Q_n = (1-gamma_0)*P_a1_null+gamma_0;
        L1 = binocdf(i-1,N,1-Q_n);
        p_of_sig(ii) = sum((L1<alpha).*ostatp);
    end
end
P_sig(gamma_ind,N_ind) = sum(n_g_plusp.*p_of_sig);
    
%% i is the largest number
i=0;prob_min = 0;
while prob_min < alpha
i=i+1;prob_min =  binocdf(i-1,N,(1-gamma_0));
end
i=i-1;

% pdf of number of gamma_minus participant
n_g_plus   = 0:N;
n_g_plusp  = binopdf(n_g_plus,N,gamma);
ii = 0;
clear p_of_sig
for this_n_g_plus = n_g_plus
    ii=ii+1;
    this_n_g_minus = N - this_n_g_plus;
    if this_n_g_minus < i
        p_of_sig(ii) = 1;
    else
        
        ostat_cdf = 1 - binocdf(i-1,this_n_g_minus,binocdf(0:100,100,.5));
        ostatp     = [ostat_cdf(1), diff(ostat_cdf)];
        ostat = 0:100;
        
        P_a1_null = binocdf(ostat,100,.5,'upper');
        Q_n = (1-gamma_0)*P_a1_null+gamma_0;
        L1 = binocdf(i-1,N,1-Q_n);
        p_of_sig(ii) = sum((L1<alpha).*ostatp);
    end
end
P_sig2(gamma_ind,N_ind) = sum(n_g_plusp.*p_of_sig);

end
end

for N_ind2 = 2:N_ind
    figure
    plot([P_sig(:,N_ind2) P_sig2(:,N_ind2)])
end


figure; hold on
for N_ind2 = 2:N_ind
    plot([P_sig(:,N_ind2) P_sig2(:,N_ind2)])
end
plot([51 51], [0 1], 'k--')
plot([0 100], [0.05 .05], 'k--')
axis([1 101 0 1])


figure; hold on
for N_ind2 = 2:N_ind
    plot([P_sig(:,N_ind2)])
    pause
end

