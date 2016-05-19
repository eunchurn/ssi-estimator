clear all; clc; close all;

D=dir('PL*.csv');
for kk=1:length(D)
    filename = D(kk).name;
    eval(['data',num2str(kk),' = csvread(filename);']);
end

data=[data1(1:7193),data2(1:7193),data3(1:7193)];
WINDOW=[];
NOVERLAP=[];
NFFT=4096;
Fs=128;
for kk=1:3
[Pxx(:,kk),F] = pwelch(detrend(data(:,kk)),WINDOW,NOVERLAP,NFFT,Fs);
end
figure,loglog(F,Pxx)
freqband=[F(1) F(end)];
minorder=1;
maxorder=100;
[na_freq, modevec, xi, na_freq_cov, modevec_cov, xi_cov, estVarBRfreq, estVarBRzeta] = simple_ssi_estimator(data,Fs,freqband,minorder,maxorder);
%%
figure
[hAx,hLine1,hLine2]=plotyy(F,Pxx,estVarBRfreq(:,1),estVarBRfreq(:,2),'semilogy','plot');
hLine2.LineStyle='none';
hLine2.Marker='.';
xlim(hAx(1),[F(1) F(end)]);
xlim(hAx(2),[F(1) F(end)]);
ylabel(hAx(1),'Power spectral density');
ylabel(hAx(2),'Order');
xlabel('Frequency (Hz)');
