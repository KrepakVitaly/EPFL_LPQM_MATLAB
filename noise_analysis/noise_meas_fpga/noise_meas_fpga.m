clear all; close all;
cd(fileparts(mfilename('fullpath')));

START_AVERAGING = 9000;
STOP_AVERAGING = 10401;

Data1uW_pickoff_input = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1. 1uW pickoff input.txt');
Data1uW_pickoff_out = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1. 1 uW pickoff out.txt');
Data1uW_pickoff_out_5MHz_LPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1. 1 uW pickoff out - 5MHz low pass.txt');
Data1uW_pickoff_out_5MHz_LPF_1Hz4_HPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1. 1 uW pickoff out - 5MHz low pass+ 1.4 high pass.txt');
Data1uW_pickoff_out_b_5MHz_LPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1b. 1 uW pickoff out - 5MHz low pass.txt');
Data1uW_pickoff_out_c_5MHz_LPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1c. 1 uW pickoff out - 5MHz low pass.txt');
Data1uW_pickoff_out_d_5MHz_LPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1d. 1 uW pickoff out - 5MHz low pass.txt');
Data1uW_pickoff_out_e_5MHz_LPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1e. 1 uW pickoff out - 5MHz low pass.txt');
Data1uW_pickoff_out_f_5MHz_LPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1f. 1 uW pickoff out - 5MHz low pass.txt');
Data1uW_pickoff_out_g_5MHz_LPF = ...
    importdata('\\lpqm1srv3.epfl.ch\He3\Measurement Campaigns\2017-03-16 FPGA noise test\1g. 1 uW pickoff out - 5MHz low pass.txt');

data_peaks = [];
mean_noise = [];

data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_input(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_5MHz_LPF(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_5MHz_LPF_1Hz4_HPF(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_b_5MHz_LPF(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_c_5MHz_LPF(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_d_5MHz_LPF(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_e_5MHz_LPF(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_f_5MHz_LPF(: ,2))));
data_peaks(end+1) = max(mag2db(abs(Data1uW_pickoff_out_g_5MHz_LPF(: ,2))));

mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_input(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_5MHz_LPF(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_5MHz_LPF_1Hz4_HPF(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_b_5MHz_LPF(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_c_5MHz_LPF(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_d_5MHz_LPF(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_e_5MHz_LPF(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_f_5MHz_LPF(START_AVERAGING:STOP_AVERAGING ,2))));
mean_noise(end+1) = mean(mag2db(abs(Data1uW_pickoff_out_g_5MHz_LPF(START_AVERAGING:STOP_AVERAGING ,2))));

snr = (data_peaks - mean_noise).';

figure
plot( Data1uW_pickoff_input(: ,1), mag2db(abs(Data1uW_pickoff_input(: ,2))) )
hline = refline([0 mean_noise(1)]);

hold on

plot( Data1uW_pickoff_out(: ,1), mag2db(abs(Data1uW_pickoff_out(: ,2))) );
hline = refline([0 mean_noise(2)]);
hline.Color = 'r';

plot( Data1uW_pickoff_out_5MHz_LPF(: ,1), mag2db(abs(Data1uW_pickoff_out_5MHz_LPF(: ,2))) );

plot( Data1uW_pickoff_out_5MHz_LPF_1Hz4_HPF(: ,1), mag2db(abs(Data1uW_pickoff_out_5MHz_LPF_1Hz4_HPF(: ,2))) );
plot( Data1uW_pickoff_out_b_5MHz_LPF(: ,1), mag2db(abs(Data1uW_pickoff_out_b_5MHz_LPF(: ,2))) );
plot( Data1uW_pickoff_out_c_5MHz_LPF(: ,1), mag2db(abs(Data1uW_pickoff_out_c_5MHz_LPF(: ,2))) );
plot( Data1uW_pickoff_out_d_5MHz_LPF(: ,1), mag2db(abs(Data1uW_pickoff_out_d_5MHz_LPF(: ,2))) );
plot( Data1uW_pickoff_out_e_5MHz_LPF(: ,1), mag2db(abs(Data1uW_pickoff_out_e_5MHz_LPF(: ,2))) );
plot( Data1uW_pickoff_out_f_5MHz_LPF(: ,1), mag2db(abs(Data1uW_pickoff_out_f_5MHz_LPF(: ,2))) );
plot( Data1uW_pickoff_out_g_5MHz_LPF(: ,1), mag2db(abs(Data1uW_pickoff_out_g_5MHz_LPF(: ,2))) );
hline = refline([0 mean_noise(10)]);
hline.Color = 'y';
hold off
ylabel('Amplitude, dB');
xlabel('Frequency, Hz');
legend('1uW pickoff input','REFLINE 1uW pickoff input', '1uW pickoff out', 'REFLINE 1uW pickoff out', '1uW pickoff out 5MHzLPF');

figure;
bar( snr );
ylim( [min(snr)-1 max(snr)+1] );
ylabel('Singal max value to noise level ratio, dB');
xlabel('Different settings of feedback');
% legend('1uW pickoff input','1uW pickoff out');

