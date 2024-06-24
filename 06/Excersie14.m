% Load the data
load('data.mat', 'data'); % Use appropriate file format, such as .txt or .csv
population = data(:, 1);
profit = data(:, 2);

% Plot the data
figure;
scatter(population, profit, 'r', 'filled');
title('Profit vs Population');
xlabel('Population of City (10,000s)');
ylabel('Profit ($10,000s)');
grid on;

% Visually estimate the linear fit
hold on;
estimated_intercept = -5; % rough estimate
estimated_slope = 1.3;   % rough estimate
y_estimated = estimated_slope * population + estimated_intercept;
plot(population, y_estimated, 'b-');
%legend('Data', 'Estimated Fit');

% Predict the profit for a population of 35K
population_35k = 35; % 35K population
profit_35k_estimated = estimated_slope * population_35k + estimated_intercept;
fprintf('Estimated profit for a population of 35K: $%.2f\n', profit_35k_estimated * 10000);

% Use polyfit to estimate parameters for a linear fit
p = polyfit(population, profit, 1);
fitted_slope = p(1);
fitted_intercept = p(2);

% Plot the new linear fit
y_fitted = fitted_slope * population + fitted_intercept;
plot(population, y_fitted, 'g-');
legend('Data', 'Estimated Fit', 'Polyfit Fit');
hold off;

% Predict the profit for a population of 35K using polyfit
profit_35k_fitted = fitted_slope * population_35k + fitted_intercept;
fprintf('Polyfit estimated profit for a population of 35K: $%.2f\n', profit_35k_fitted * 10000);

% Compare the error of both fits
error_estimated = sum((profit - y_estimated).^2);
error_fitted = sum((profit - y_fitted).^2);

fprintf('Least squares error for the estimated fit: %.2f\n', error_estimated);
fprintf('Least squares error for the polyfit fit: %.2f\n', error_fitted);
