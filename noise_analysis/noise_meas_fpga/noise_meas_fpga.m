% clear all; close all;
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

legend_array = {'Input signal', 'FPGAout, no filtering, FS=1.5V', 'FPGAout, 5MHz LPF,FS=1.5V', 'FPGAout 5MHz LPF, 1.4MHz HPF, FS=1.5V',...
    'FPGAout, 5MHz LPF, FS=1V', 'FPGAout, 5MHz LPF, FS=2V', 'FPGAout, 5MHz LPF, FS=3V',...
    'FPGAout, 5MHz LPF, FS=4V', 'FPGAout, 5MHz LPF, FS=3V, 3dB atten', 'FPGAout, 5MHz LPF, FS=3V, AMP+atten 20dB' };

frequencies = Data1uW_pickoff_out_b_5MHz_LPF(: ,1);
freq_size = size(frequencies);
freq_num = freq_size(1);
data_num = 10;

data_array = [];

data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_input(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_5MHz_LPF(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_5MHz_LPF_1Hz4_HPF(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_b_5MHz_LPF(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_c_5MHz_LPF(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_d_5MHz_LPF(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_e_5MHz_LPF(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_f_5MHz_LPF(: ,2))));
data_array(:, end+1) = (mag2db(abs(Data1uW_pickoff_out_g_5MHz_LPF(: ,2))));

data_peaks = [];
mean_noise = [];

for n = 1:data_num
    data_peaks(n) = max(data_array(:,n));
end

for n = 1:data_num
    mean_noise(end+1) = mean(data_array(START_AVERAGING:STOP_AVERAGING,n));
end

snr = (data_peaks - mean_noise).';

% hline = refline([0 mean_noise(1)]);
% hline.Color = 'r';

% figure
% hold on
% for n = 1:data_num
%     plot( frequencies, data_array(:,n) - data_peaks(n));
% end
% hold off
% ylabel('Amplitude, dB');  
% xlabel('Frequency, Hz');
% legend(legend_array);

% figure;
% bar( snr );
% ylim( [min(snr)-1 max(snr)+1] );
% ylabel('Singal max value to noise level ratio, dB');
% xlabel('Different settings of feedback');

% for n = 2:data_num
%     figure
%     hold on
%     plot( frequencies, data_array(:,1) - data_peaks(1) );
%     plot( frequencies, data_array(:,n) - data_peaks(n) );
%     hold off
%     ylabel('Amplitude, dB');  
%     xlabel('Frequency, Hz');
%     legend([legend_array(1), legend_array(n)] );
% end
figure
hold on
% n=1
plotStyle = [[0 1 0]; [1 0 0]; [0 0 1]; [0 1 1]; [1 1 0]; [1 0 1]; [0 0.5 0.1]; [0.5 0.5 0.1]; [0.5 0.1 0.5]; [0.1 0.5 0.5]];
plotStyle(n, :)
for n = 1:data_num
    plot( frequencies, -data_array(:,1) + data_peaks(1) + data_array(:,n) - data_peaks(n), 'Color',plotStyle(n, :) );
end
hold off
ylabel('Added Noise, dB');  
xlabel('Frequency, Hz');
legend(legend_array);

