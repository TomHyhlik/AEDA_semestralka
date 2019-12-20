% Data analysis using correlations. In this script we examine whether the
% measured data reflect UPDRS and UHDRS score.
clear 
clc
close all

loadedData = readtable('Data.xlsx');
EFNmean = loadedData.EFNMean_dB_;
EFNsd = loadedData.EFNSD_dB_;
EFNtrend = loadedData.EFNTrend_dB_s_;

N = 37;      % number of group samples

range_PD = 1 : N;
range_HD = N+1 : 2*N;
range_HC = 2*N+1 : 3*N;

%% Convert the scales to double format
%PD
PD.UPDRS = str2double(loadedData.UPDRSIII(range_PD));
PD.speechItem = str2double(loadedData.speechItem18(range_PD));
PD.bradykinesia = str2double(loadedData.bradykinesiaSubscore(range_PD));
% HD
HD.UHDRS = str2double(loadedData.UHDRS(range_HD));
HD.speechItem = str2double(loadedData.speechItem(range_HD));
HD.chorea = str2double(loadedData.choreaSubscore(range_HD));

%% Perform correlations using Spearman method
pd_r = zeros(3, 3); pd_p = zeros(3, 3);
% PD EFNmean
[pd_r(1,1), pd_p(1,1)] = corr(EFNmean(range_PD), PD.UPDRS, 'type', 'Spearman');
[pd_r(2,1), pd_p(2,1)] = corr(EFNmean(range_PD), PD.speechItem, 'type', 'Spearman');
[pd_r(3,1), pd_p(3,1)] = corr(EFNmean(range_PD), PD.bradykinesia, 'type', 'Spearman');
% PD EFNsd
[pd_r(1,2), pd_p(1,2)] = corr(EFNsd(range_PD), PD.UPDRS, 'type', 'Spearman');
[pd_r(2,2), pd_p(2,2)] = corr(EFNsd(range_PD), PD.speechItem, 'type', 'Spearman');
[pd_r(3,2), pd_p(3,2)] = corr(EFNsd(range_PD), PD.bradykinesia, 'type', 'Spearman');
% PD EFNtrend
[pd_r(1,3), pd_p(1,3)] = corr(EFNtrend(range_PD), PD.UPDRS, 'type', 'Spearman');
[pd_r(2,3), pd_p(2,3)] = corr(EFNtrend(range_PD), PD.speechItem, 'type', 'Spearman');
[pd_r(3,3), pd_p(3,3)] = corr(EFNtrend(range_PD), PD.bradykinesia, 'type', 'Spearman');

hd_r = zeros(3, 3); hd_p = zeros(3, 3);
% HD EFNmean
[hd_r(1,1), hd_p(1,1)] = corr(EFNmean(range_HD), HD.UHDRS, 'type', 'Spearman', 'rows','complete');
[hd_r(2,1), hd_p(2,1)] = corr(EFNmean(range_HD), HD.speechItem, 'type', 'Spearman', 'rows','complete');
[hd_r(3,1), hd_p(3,1)] = corr(EFNmean(range_HD), HD.chorea, 'type', 'Spearman', 'rows','complete');
% HD EFNsd
[hd_r(1,2), hd_p(1,2)] = corr(EFNsd(range_HD), HD.UHDRS, 'type', 'Spearman', 'rows','complete');
[hd_r(2,2), hd_p(2,2)] = corr(EFNsd(range_HD), HD.speechItem, 'type', 'Spearman', 'rows','complete');
[hd_r(3,2), hd_p(3,2)] = corr(EFNsd(range_HD), HD.chorea, 'type', 'Spearman', 'rows','complete');
% HD EFNtrend
[hd_r(1,3), hd_p(1,3)] = corr(EFNtrend(range_HD), HD.UHDRS, 'type', 'Spearman', 'rows','complete');
[hd_r(2,3), hd_p(2,3)] = corr(EFNtrend(range_HD), HD.speechItem, 'type', 'Spearman', 'rows','complete');
[hd_r(3,3), hd_p(3,3)] = corr(EFNtrend(range_HD), HD.chorea, 'type', 'Spearman', 'rows','complete');