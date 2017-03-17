clear all; close all;
cd(fileparts(mfilename('fullpath')));

FSTOP_AVERAGING = 20000000;
START_AVERAGING = 200;
STOP_AVERAGING = 1180;
Mean_input = [];
Mean_output = [];

Data1000mVpp_noise0_math1 = importdata('./1000mVpp/0spectrummath1.Wfm.csv');
Data1000mVpp_noise0_math2 = importdata('./1000mVpp/0spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise0_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise0_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise1_math1 = importdata('./1000mVpp/1spectrummath1.Wfm.csv');
Data1000mVpp_noise1_math2 = importdata('./1000mVpp/1spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise1_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise1_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise2_math1 = importdata('./1000mVpp/2spectrummath1.Wfm.csv');
Data1000mVpp_noise2_math2 = importdata('./1000mVpp/2spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise2_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise2_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise3_math1 = importdata('./1000mVpp/3spectrummath1.Wfm.csv');
Data1000mVpp_noise3_math2 = importdata('./1000mVpp/3spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise3_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise3_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise4_math1 = importdata('./1000mVpp/4spectrummath1.Wfm.csv');
Data1000mVpp_noise4_math2 = importdata('./1000mVpp/4spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise4_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise4_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise5_math1 = importdata('./1000mVpp/5spectrummath1.Wfm.csv');
Data1000mVpp_noise5_math2 = importdata('./1000mVpp/5spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise5_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise5_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise6_math1 = importdata('./1000mVpp/6spectrummath1.Wfm.csv');
Data1000mVpp_noise6_math2 = importdata('./1000mVpp/6spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise6_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise6_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise8_math1 = importdata('./1000mVpp/8spectrummath1.Wfm.csv');
Data1000mVpp_noise8_math2 = importdata('./1000mVpp/8spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise8_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise8_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise10_math1 = importdata('./1000mVpp/10spectrummath1.Wfm.csv');
Data1000mVpp_noise10_math2 = importdata('./1000mVpp/10spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise10_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise10_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise12_math1 = importdata('./1000mVpp/12spectrummath1.Wfm.csv');
Data1000mVpp_noise12_math2 = importdata('./1000mVpp/12spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise12_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise12_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise15_math1 = importdata('./1000mVpp/15spectrummath1.Wfm.csv');
Data1000mVpp_noise15_math2 = importdata('./1000mVpp/15spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise15_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise15_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise18_math1 = importdata('./1000mVpp/18spectrummath1.Wfm.csv');
Data1000mVpp_noise18_math2 = importdata('./1000mVpp/18spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise18_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise18_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise20_math1 = importdata('./1000mVpp/20spectrummath1.Wfm.csv');
Data1000mVpp_noise20_math2 = importdata('./1000mVpp/20spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise20_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise20_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise25_math1 = importdata('./1000mVpp/25spectrummath1.Wfm.csv');
Data1000mVpp_noise25_math2 = importdata('./1000mVpp/25spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise25_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise25_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise35_math1 = importdata('./1000mVpp/35spectrummath1.Wfm.csv');
Data1000mVpp_noise35_math2 = importdata('./1000mVpp/35spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise35_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise35_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise45_math1 = importdata('./1000mVpp/45spectrummath1.Wfm.csv');
Data1000mVpp_noise45_math2 = importdata('./1000mVpp/45spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise45_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise45_math2(START_AVERAGING:STOP_AVERAGING));
Data1000mVpp_noise50_math1 = importdata('./1000mVpp/50spectrummath1.Wfm.csv');
Data1000mVpp_noise50_math2 = importdata('./1000mVpp/50spectrummath2.Wfm.csv');
Mean_input(end+1) = mean(Data1000mVpp_noise50_math1(START_AVERAGING:STOP_AVERAGING));
Mean_output(end+1) = mean(Data1000mVpp_noise50_math2(START_AVERAGING:STOP_AVERAGING));

Noise_figure = abs(Mean_input-Mean_output);

figure
noise_level = [0 1 2 3 4 5 6 8 10 12 15 18 20 25 35 45 50];
plot(noise_level, Noise_figure)
% hold on
% plot(Mean_output)
% hold off


% figure
% plot(Data1000mVpp_noise0_math1)
% title('Combine Plots')
% 
% hold on
% t = 0:1:Size(1);
% plot(t, ones(size(t))*MeanData1000mVpp_noise0_math1)
% plot(t, ones(size(t))*MeanData1000mVpp_noise0_math2)
% plot(Data1000mVpp_noise0_math2)
% hold off


% spectrum = importdata('0spectrum.Wfm.csv');
% spectrum2 = importdata('0spectrummath2.Wfm.csv');
% % plot(spectrum);
% plot((spectrum2-spectrum));

% Size = size(a);
% 
% T = a(2,1)-a(1,1);             % Sampling period  
% Fs = 1/T;            % Sampling frequency                    
%      
% L = Size(1);             % Length of signal
% t = (0:L-1)*T;        % Time vector
% 
% % plot(a(1:5000,1),a(1:5000,2));
% % title('Signal Corrupted with Zero-Mean Random Noise')
% % xlabel('t (milliseconds)')
% % ylabel('X(t)')
% 
% Y = fft(a(:,2));
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% plot(Y);
% 
% f = Fs*(0:(L/2))/L;
% 
% P1dB = mag2db(abs(P1/sqrt(5)*10));
% 
% plot(f,P1dB) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% plot(a(1:5000,1),a(1:5000,2));
% title('Signal Corrupted with Zero-Mean Random Noise')
% xlabel('t (milliseconds)')
% ylabel('X(t)')