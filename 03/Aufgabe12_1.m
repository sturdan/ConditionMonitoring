% Define the parameters
tS = 0;                 % Start time
tE = 10;                % End time
sample_frequency = 10;  % Sample frequency Δt^-1

% Generate the time series
t = linspace(tS, tE, (tE - tS) * sample_frequency+1);

% Define the parameters for the sinusoidal signals
A1 = 1.3;            % Amplitude of the first sinusoidal signal
f1 = 0.5;            % Frequency of the first sinusoidal signal (Hz)

A2 = 3;              % Amplitude of the second sinusoidal signal
f2 = 1;              % Frequency of the second sinusoidal signal (Hz)

% Generate the sinusoidal signals
sig1 = A1 * sin(2 * pi * f1 * t);
sig2 = A2 * sin(2 * pi * f2 * t);

% Combine the signals
sig = sig1 + sig2;

% Add noise
noise_magnitude = 0.8;
noise = noise_magnitude * randn(size(t));
sig_noisy = sig + noise;

% Plot the signal
figure;
plot(t, sig_noisy);
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Sinusoidal Signal');
grid on;

% Extract the maximum and mean of sig
max_value = max(sig_noisy);
mean_value = mean(sig_noisy);


% Find the time at which the maximum occurs
[~, max_index] = max(sig_noisy);
time_of_max = t(max_index);

sig_normalized = (sig_noisy - mean(sig_noisy)) / std(sig_noisy);

% Replot the normalized signal
figure;
plot(t, sig_normalized);
xlabel('Time (s)');
ylabel('Normalized Amplitude');
title('Normalized Noisy Sinusoidal Signal');
grid on;

% Compute the FFT
L = length(sig_noisy);
Y = fft(sig_noisy);

% Compute the two-sided spectrum P2
P2 = abs(Y / L);
% Compute the single-sided spectrum P1
P1 = P2(1:L/2+1);
P1(2:end-1) = 2 * P1(2:end-1);

% Define the frequency domain f
f = sample_frequency * (0:L-1);

% Plot the power spectrum
figure;
plot(f, P2);
xlabel('Frequency (Hz)');
ylabel('Power');
title('Power Spectrum of Noisy Sinusoidal Signal');
grid on;

