% Load the data
load('Gear1_1e5.mat'); % Assuming the variable is named 'gear1'
load('Gang2.mat'); % Assuming the variable is named 'gear1'
load('Gear3_1e6.mat'); % Assuming the variable is named 'gear3'
load('GearX_1e5.mat'); % Assuming the variable is named 'gearX'

% Resample Gear3 data to match the sampling frequency of Gear1
gear3_resampled = resample(Gang3, 1, 10); % Using resample function
gear2_resampled = resample(Gang2, 1, 10); % Using resample function

% Calculate average and RMS for Gear1
average_gear1 = mean(Gang1_1e5);
rms_gear1 = rms(Gang1_1e5);

% Calculate average and RMS for Gear2
average_gear2 = mean(gear2_resampled);
rms_gear2 = rms(gear2_resampled);

% Calculate average and RMS for Gear3 resampled
average_gear3_resampled = mean(gear3_resampled);
rms_gear3_resampled = rms(gear3_resampled);

% Calculate average and RMS for GearX
average_gearX = mean(GangX);
rms_gearX = rms(GangX);

% Display the results
fprintf('Gear1 - Average Amplitude: %.2f, RMS Amplitude: %.2f\n', average_gear1, rms_gear1);
fprintf('Gear3 Resampled - Average Amplitude: %.2f, RMS Amplitude: %.2f\n', average_gear3_resampled, rms_gear3_resampled);
fprintf('GearX - Average Amplitude: %.2f, RMS Amplitude: %.2f\n', average_gearX, rms_gearX);

% FFT for Gear1
L1 = length(Gang1_1e5);
Y1 = fft(Gang1_1e5);
P2_1 = abs(Y1/L1);
P1_1 = P2_1(1:L1/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);
f1 = (0:(L1/2))/L1 * 1e5; % Frequency vector for Gear1

% FFT for Gear2 resampled
L2 = length(gear2_resampled);
Y2 = fft(gear2_resampled);
P2_2 = abs(Y2/L2);
P1_2 = P2_2(1:L2/2+1);
P1_2(2:end-1) = 2*P1_2(2:end-1);
f2 = (0:(L2/2))/L2 * 1e5; % Frequency vector for Gear3 resampled


% FFT for Gear3 resampled
L3 = length(gear3_resampled);
Y3 = fft(gear3_resampled);
P2_3 = abs(Y3/L3);
P1_3 = P2_3(1:L3/2+1);
P1_3(2:end-1) = 2*P1_3(2:end-1);
f3 = (0:(L3/2))/L3 * 1e5; % Frequency vector for Gear3 resampled

% FFT for GearX
Lx = length(GangX);
Yx = fft(GangX);
P2_x = abs(Yx/Lx);
P1_x = P2_x(1:Lx/2+1);
P1_x(2:end-1) = 2*P1_x(2:end-1);
fx = (0:(Lx/2))/Lx * 1e5; % Frequency vector for GearX

% Plot the frequency spectra
figure;
subplot(3,1,1);
plot(f1, P1_1);
title('Frequency Spectrum of Gear1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,2);
plot(f3, P1_3);
title('Frequency Spectrum of Gear3 Resampled');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,3);
plot(fx, P1_x);
title('Frequency Spectrum of GearX');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Find peak frequency for Gear1
[~, idx1] = max(P1_1);
peak_freq_gear1 = f1(idx1);

% Find peak frequency for Gear3 resampled
[~, idx3] = max(P1_3);
peak_freq_gear3_resampled = f3(idx3);

% Find peak frequency for GearX
[~, idxX] = max(P1_x);
peak_freq_gearX = fx(idxX);

% Display the peak frequencies
fprintf('Gear1 - Peak Frequency: %.2f Hz\n', peak_freq_gear1);
fprintf('Gear3 Resampled - Peak Frequency: %.2f Hz\n', peak_freq_gear3_resampled);
fprintf('GearX - Peak Frequency: %.2f Hz\n', peak_freq_gearX);

% Determine the gear of GearX by comparing peak frequencies
if abs(peak_freq_gearX - peak_freq_gear1) < abs(peak_freq_gearX - peak_freq_gear3_resampled)
    fprintf('GearX is most likely Gear1.\n');
else
    fprintf('GearX is most likely Gear3.\n');
end
