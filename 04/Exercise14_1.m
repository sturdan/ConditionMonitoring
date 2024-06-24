% Load the data
load('Gear1_1e5.mat'); % Assuming the variable is named 'gear1'
load('Gear3_1e6.mat'); % Assuming the variable is named 'gear3'


% Resample Gear3 data to match the sampling frequency of Gear1
Gang3_resampled = resample(Gang3, 1, 10); % Using resample function
% Alternatively, you can use:
% gear3_resampled = gear3(1:10:end); % Using colon operator

% Verify the lengths of the signals
length_gear1 = length(Gang1_1e5);
length_gear3_resampled = length(Gang3_resampled);

fprintf('Length of Gear1 data: %d\n', length_gear1);
fprintf('Length of Gear3 resampled data: %d\n', length_gear3_resampled);

% Optional: Save the resampled data
save('Gear3_Resampled.mat', 'Gang3_resampled');


% Plot Gear1 data
figure;
subplot(2,1,1);
plot(Gang3);
title('Gear1 Data');
xlabel('Sample Number');
ylabel('Amplitude');

% Plot Gear3 resampled data
subplot(2,1,2);
plot(Gang3_resampled);
title('Gear3 Resampled Data');
xlabel('Sample Number');
ylabel('Amplitude');

% Calculate average and RMS for Gear1
average_gear1 = mean(Gang1_1e5);
rms_gear1 = rms(Gang1_1e5);

% Calculate average and RMS for Gear3 resampled
average_gear3_resampled = mean(Gang3_resampled);
rms_gear3_resampled = rms(Gang3_resampled);

% Display the results
fprintf('Gear1 - Average Amplitude: %.2f, RMS Amplitude: %.2f\n', average_gear1, rms_gear1);
fprintf('Gear3 Resampled - Average Amplitude: %.2f, RMS Amplitude: %.2f\n', average_gear3_resampled, rms_gear3_resampled);


% FFT for Gear1
L1 = length(Gang1_1e5);
Y1 = fft(Gang1_1e5);
P2_1 = abs(Y1/L1);
P1_1 = P2_1(1:L1/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);
f1 = (0:(L1/2))/L1 * 1e5; % Frequency vector for Gear1

% FFT for Gear3 resampled
L3 = length(Gang3_resampled);
Y3 = fft(Gang3_resampled);
P2_3 = abs(Y3/L3);
P1_3 = P2_3(1:L3/2+1);
P1_3(2:end-1) = 2*P1_3(2:end-1);
f3 = (0:(L3/2))/L3 * 1e5; % Frequency vector for Gear3 resampled

% Plot the frequency spectra
figure;
subplot(2,1,1);
plot(f1, P1_1);
title('Frequency Spectrum of Gear1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f3, P1_3);
title('Frequency Spectrum of Gear3 Resampled');
xlabel('Frequency (Hz)');
ylabel('Magnitude');