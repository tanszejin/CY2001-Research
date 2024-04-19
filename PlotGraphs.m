snr_vector=5:5:25;
g = [0.2660 0.6740 0.2880];
o = [0.8500 0.3250 0.0980];
b = [0 0.2470 0.7410];

% % compare one QAM with LS MMSE
% load("BER_LS_MMSE.mat", ...
%     "r_LS_64QAM_8pilots","r_MMSE_64QAM_8pilots",  ...
%     "r_LS_64QAM_16pilots","r_MMSE_64QAM_16pilots", ...
%     "r_LS_64QAM_64pilots","r_MMSE_64QAM_64pilots");
% figure;
% xlabel('SNR /dB');
% ylabel('BER');
% set(gca,'yscale','log')
% ylim([0.0001 10]);
% xlim([0 30]);
% hold on;
% load("BER_64QAM_added80layer_K64_8output_8pilot.mat", "BER");
% dnn8 = semilogy(snr_vector,BER,'-+');
% dnn8.Color = b;
% ls8 = semilogy(snr_vector,r_LS_64QAM_8pilots,'-o');
% ls8.Color = g;
% mmse8 = semilogy(snr_vector,r_MMSE_64QAM_8pilots,'-s');
% mmse8.Color = o;
% load("BER_64QAM_added80layer_K64_8output_16pilot.mat", "BER");
% dnn16 = semilogy(snr_vector,BER,':+');
% dnn16.Color = b;
% ls16 = semilogy(snr_vector,r_LS_64QAM_16pilots,':o');
% ls16.Color = g;
% mmse16 = semilogy(snr_vector,r_MMSE_64QAM_16pilots,':s');
% mmse16.Color = o;
% load("BER_64QAM_added80layer_K64_8output_64pilot.mat", "BER");
% dnn64 = semilogy(snr_vector,BER,'--+');
% dnn64.Color = b;
% ls64 = semilogy(snr_vector,r_LS_64QAM_64pilots,'--o');
% ls64.Color = g;
% mmse64 = semilogy(snr_vector,r_MMSE_64QAM_64pilots,'--s');
% mmse64.Color = o;
% legend('8 Pilots 64-QAM DNN','8 Pilots 64-QAM LS CE','8 Pilots 64-QAM MMSE CE', ...
%     '16 Pilots 64-QAM DNN','16 Pilots 64-QAM LS CE','16 Pilots 64-QAM MMSE CE', ...
%     '64 Pilots 64-QAM DNN','64 Pilots 64-QAM LS CE','64 Pilots 64-QAM MMSE CE');
% grid ;
% hold off;


% % compare 4, 16, 64 QAM
% figure;
% xlabel('SNR /dB');
% ylabel('BER');
% set(gca,'yscale','log');
% ylim([0.0006 1]);
% xlim([0 30]);
% hold on;
% load("BER_4QAM_K64_8output_8pilot.mat", "BER");
% a = semilogy(snr_vector,BER,'-+');
% a.Color = 'r';
% load("BER_4QAM_K64_8output_16pilot.mat", "BER");
% a = semilogy(snr_vector,BER,':x');
% a.Color = 'r';
% load("BER_4QAM_K64_8output_64pilot.mat", "BER");
% a = semilogy(snr_vector,BER,'--^');
% a.Color = 'r';
% 
% load("BER_16QAM_K64_8output_8pilot.mat", "BER");
% b = semilogy(snr_vector,BER,'-o');
% b.Color = 'b';
% load("BER_16QAM_K64_8output_16pilot.mat", "BER");
% b = semilogy(snr_vector,BER,':.');
% b.Color = 'b';
% load("BER_16QAM_K64_8output_64pilot.mat", "BER");
% b = semilogy(snr_vector,BER,'--*');
% b.Color = 'b';
% 
% load("BER_64QAM_added80layer_K64_8output_8pilot.mat", "BER");
% a = semilogy(snr_vector,BER,'-s');
% a.Color = g;
% load("BER_64QAM_added80layer_K64_8output_16pilot.mat", "BER");
% a = semilogy(snr_vector,BER,':>');
% a.Color = g;
% load("BER_64QAM_added80layer_K64_8output_64pilot.mat", "BER");
% a = semilogy(snr_vector,BER,'--<');
% a.Color = g;
% 
% legend('4-QAM 8 Pilots','4-QAM 16 Pilots', '4-QAM 64 Pilots', ...
%     '16-QAM 8 Pilots', '16-QAM 16 Pilots', '16-QAM 64 Pilots', ...
%     '64-QAM 8 Pilots','64-QAM 16 Pilots', '64-QAM 64 Pilots');
% grid ;
% hold off;


% % full output vs 8 output
% figure;
% xlabel('SNR /dB');
% ylabel('BER');
% ylim([10^(-4) 0.4]);
% hold on;
% load("BER_4QAM_K64_8output_16pilot.mat", "BER");
% semilogy(snr_vector,BER,'-+');
% load("BER_4QAM_K64_fulloutput_16pilot.mat", "BER");
% semilogy(snr_vector,BER,'-x');
% legend('4-QAM 8 symbol output', '4-QAM full output');
% grid ;
% hold off;


% % clipping vs no clipping
% load("BER_LS_MMSE.mat", ...
%     "r_MMSE_4QAM_16pilots", "r_MMSE_16QAM_16pilots", "r_MMSE_64QAM_16pilots", ...
%     "r_MMSE_Clipping_4QAM_16pilots", "r_MMSE_Clipping_16QAM_16pilots", "r_MMSE_Clipping_64QAM_16pilots");
% figure;
% xlabel('SNR /dB');
% ylabel('BER');
% set(gca,'yscale','log');
% ylim([10^(-2) 1]);
% hold on;
% load("BER_64QAM_added80layer_K64_8output_16pilot.mat", "BER");
% a = semilogy(snr_vector,BER,'-+');
% a.Color = g;
% load("BER_64QAM_Clipping_K64_8output_16pilot.mat", "BER");
% a = semilogy(snr_vector,BER,'--x');
% a.Color = g;
% b = semilogy(snr_vector,r_MMSE_64QAM_16pilots,'-+');
% b.Color = 'b';
% b = semilogy(snr_vector,r_MMSE_Clipping_64QAM_16pilots,'--x');
% b.Color = 'b';
% legend('64-QAM 16 Pilot DNN', '64-QAM 16 Pilot DNN Clipped', ...
%     '64-QAM 16 Pilot MMSE CE', '64-QAM 16 Pilot MMSE CE Clipped');
% grid ;
% hold off;


% rnn vs dnn
figure;
xlabel('SNR /dB');
ylabel('BER');
set(gca,'yscale','log');
ylim([10^(-3) 0.4]);
hold on;
load("BER_4QAM_K64_8output_8pilot.mat", "BER");
a = semilogy(snr_vector,BER,'-+');
a.Color = 'r';
load("BER_16QAM_K64_8output_8pilot.mat", "BER");
a = semilogy(snr_vector,BER,'-x');
a.Color = 'r';
load("BER_64QAM_added80layer_K64_8output_8pilot.mat", "BER");
a = semilogy(snr_vector,BER,'-s');
a.Color = 'r';
load("BER_RNN_4QAM_K64_8output_8pilot.mat", "BER");
b = semilogy(snr_vector,BER,'--+');
b.Color = 'b';
load("BER_RNN_16QAM_K64_8output_8pilot.mat", "BER");
b = semilogy(snr_vector,BER,'--x');
b.Color = 'b';
load("BER_RNN_64QAM_added80layer_K64_8output_8pilot.mat", "BER");
b = semilogy(snr_vector,BER,'--s');
b.Color = 'b';

legend('4-QAM 8 Pilot DNN', '16-QAM 8 Pilot DNN', '64-QAM 8 Pilot DNN', ...
    '4-QAM 8 Pilot RNN', '16-QAM 8 Pilot RNN', '64-QAM 8 Pilot RNN');
grid ;
hold off;
