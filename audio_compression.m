% Main program body

clear all;
clc;

% Read .wav audio file
% x samples from audio with fs sampling frequency in [Hz]
[x, fs] = audioread('non-compressed-audio.wav'); 

% Get length of audio in sec
% length(x) is sample length
t = length(x)./fs;
sprintf('Processing the wavefile non-compressed-audio.wav')
sprintf('The wavefile is  %3.2f  seconds long', t)

% ---------- The LPC algorithm ----------

%       x = audio samples
%       fs = sampling frequency
%       M = prediction order
%       aCoeff = LP coefficients
%       pitch_plot = pitch periods
%       voiced = voiced or unvoiced decision bit
%       gain = gain of frames

% Prediction order
M = 10;

% Call ENCODER function
[aCoeff, pitch_plot, voiced, gain] = ENCODER(x, fs, M);

% Call DECODER function
synth_speech = DECODER(aCoeff, pitch_plot, voiced, gain);

% Make sound when an error occurs
beep;

disp('Press a key to play the original sound!');
pause;
% Listen your non-compressed audio with fs frequency
soundsc(x, fs);

disp('Press a key to play the LPC compressed sound!');
pause;
% Listen your compressed audio with fs frequency
soundsc(synth_speech, fs);

% Plot figures
figure;
subplot(2,1,1), plot(x); 
title(['Original signal = "', 'non-compressed-audio', '"']); 
subplot(2,1,2), plot(synth_speech);
title(['synthesized speech of "', 'non-compressed-audio', '" using LPC algo']);