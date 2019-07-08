# Permutation-based Information Prevalence Inference using the i-th order statistic: i-pinpin

This is the MATLAB implementatation of the second-level statistical test for the decoding accuracy proposed by Hirose, 2019 (https://doi.org/10.1101/578930). The method is an extension of Permutation-based prevalence inference using the minimum statistic, proposed by Allefeld et al., (https://github.com/allefeld/prevalence-permutation/, Carsten Allefeld, Kai Görgen and John-Dylan Haynes, 'Valid population inference for information-based imaging: From the second-level t-test to prevalence inference', NeuroImage 2016).
 i-pinpin provide a way to perform the group-level statistical test for informaiton-like measures, e.g. classification accuracy, Mahalanobis distance, similarity index etc. 
******************************************************************************************************************
 ipipi.m 
    [H, prob, stat] = ipipi(SD,PD,g_0,i,alpha,homogeneity)<br>
    (N: Number of participant, Np: Number of permutatiuon for each participant)
 
 Inputs:<br>
    SD      : Sample Decoding Accuracies from experiment (N x 1 matrix)<br>
    PD      : Permutation Decoding Accuracies (N x Np matrix)<br>
    g_0     : Prevalence threshold, gannma0 (Real number between 0 and 1 default:0.5)<br>
    i          : Index of order statistics (Postive Integer, default: 1)<br>
    alpha  : statistical threshold (Real number between 0 and 1 default:0.05)<br>
    homogeneity : 1 if you assume the homogeneity of DA distribution among participants (boolean, default: 0)<br><br>
 Output:<br>
    H    : 1 if Prob < alpha, 0 otherwise<br>
    Prob : Probability of null hypothesis is rejected<br>
    stat: (structure)<br>
       .prob_min minimum probability. should be smaller than alpha.<br>
       .param          predetermined parameters (g_0,i,alpha) & number of subjects (N), number of permutations(Np)<br>
       .order_stat     i-th order statistic of S (real number)<br>
       .P_0<br>

After the first-level analysis is completed, we achive first-level summary statistics for each participant (SD). Also, by performing permutation test or other empirical test, we obtain samples from null distribution (PD).
i-pinpin reqires three predetermined parameters, that is, g_0, i and alpha. For detail of the parameters, please see the original paper (Hirose 2019).
There is two slightly different versions of i-pinpin; with and without hypothesis of homogenity among subjects.
******************************************************************************************************************
