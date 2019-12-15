loadedData = readtable('Data.xlsx', 'ReadVariableNames', true)

N = 37      % pocet vzorku z kazde skupiny

range_PN = 1 : N
range_HD = N+1 : 2*N
range_HC = 2*N+1 : 3*N


%% histogramy
figure()

subplot(311)
histfit(loadedData.EFNMean_dB_(range_PN) , 10)
hold on
histfit(loadedData.EFNMean_dB_(range_HD) , 10)
hold on
histfit(loadedData.EFNMean_dB_(range_HC) , 10)
title("EFNMean_dB_")

subplot(312)
histfit(loadedData.EFNSD_dB_(range_PN) , 10)
hold on
histfit(loadedData.EFNSD_dB_(range_HD) , 10)
hold on
histfit(loadedData.EFNSD_dB_(range_HC) , 10)
title("EFNSD_dB_")

subplot(313)
histfit(loadedData.EFNTrend_dB_s_(range_PN) , 10)
hold on
histfit(loadedData.EFNTrend_dB_s_(range_HD) , 10)
hold on
histfit(loadedData.EFNTrend_dB_s_(range_HC) , 10)
title("EFNTrend_dB_s_")


%% Normalni rozdeleni dat

% matice do ktere se budou psat vysledky, pak se vypise jeji oobsah
normRozd_vysledky = []     

% PD
report = normalniRozdeleni(loadedData.EFNMean_dB_(range_PN))
normRozd_vysledky = [normRozd_vysledky; ["PN - EFNMean_dB_" report]]

report = normalniRozdeleni(loadedData.EFNSD_dB_(range_PN))
normRozd_vysledky = [normRozd_vysledky; ["PN - EFNSD_dB_" report]]

report = normalniRozdeleni(loadedData.EFNTrend_dB_s_(range_PN))
normRozd_vysledky = [normRozd_vysledky; ["PN - EFNTrend_dB_s_" report]]

% HD
report = normalniRozdeleni(loadedData.EFNMean_dB_(range_HD))
normRozd_vysledky = [normRozd_vysledky; ["HD - EFNMean_dB_" report]]

report = normalniRozdeleni(loadedData.EFNSD_dB_(range_HD))
normRozd_vysledky = [normRozd_vysledky; ["HD - EFNSD_dB_" report]]

report = normalniRozdeleni(loadedData.EFNTrend_dB_s_(range_HD))
normRozd_vysledky = [normRozd_vysledky; ["HD - EFNTrend_dB_s_" report]]

% HC
report = normalniRozdeleni(loadedData.EFNMean_dB_(range_HC))
normRozd_vysledky = [normRozd_vysledky; ["HC - EFNMean_dB_" report]]

report = normalniRozdeleni(loadedData.EFNSD_dB_(range_HC))
normRozd_vysledky = [normRozd_vysledky; ["HC - EFNSD_dB_" report]]

report = normalniRozdeleni(loadedData.EFNTrend_dB_s_(range_HC))
normRozd_vysledky = [normRozd_vysledky; ["HC - EFNTrend_dB_s_" report]]

% print normRozd_vysledky
fprintf("Normalni rozdeleni dat:\n");
for i=1 : size(normRozd_vysledky,1)
    fprintf("%s: \t%s\n", normRozd_vysledky(i, 1), normRozd_vysledky(i,2));
end

%% t-test




