% clear all; close all;
cd(fileparts(mfilename('fullpath')));

Fmax = 20000000;


Data100mVpp_noise0_math1 = importdata('./100mVpp/0spectrummath1.Wfm.csv');
Size = size(Data100mVpp_noise0_math1);
Max = Size(1);
MeanData100mVpp_noise0_math1 = mean(Data100mVpp_noise0_math1(400:Max));
Data100mVpp_noise0_math2 = importdata('./100mVpp/0spectrummath2.Wfm.csv');
MeanData100mVpp_noise0_math2 = mean(Data100mVpp_noise0_math2(400:Max));

figure
plot(Data100mVpp_noise0_math1)
title('Combine Plots')

hold on
t = 0:1:Size(1);
plot(t, ones(size(t))*MeanData100mVpp_noise0_math1)
plot(t, ones(size(t))*MeanData100mVpp_noise0_math2)
plot(Data100mVpp_noise0_math2)
hold off


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