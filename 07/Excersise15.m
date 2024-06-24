% Load the data
load('Gaenge.mat');

% Assuming each variable (gang1, gang1_b, etc.) is a matrix where rows are observations and columns are features
% Let's concatenate the unloaded state datasets
unloaded_data = [gang1; gang2; gang3];

% Label the unloaded state data
labels = [ones(size(gang1, 1), 1); 2 * ones(size(gang2, 1), 1); 3 * ones(size(gang3, 1), 1)];
unloaded_data_labeled = [unloaded_data, labels];

% Shuffle the data to ensure even distribution
unloaded_data_labeled = unloaded_data_labeled(randperm(size(unloaded_data_labeled, 1)), :);

% Split into training (500 observations) and testing (100 observations) datasets
training_data = unloaded_data_labeled(1:1500, :);
testing_data = unloaded_data_labeled(1501:1800, :);

% Extract features and labels from training data
features = training_data(:, 1:end-1);
labels = training_data(:, end);

% Visualizing specific features with gscatter
figure;
gscatter(features(:, 2), features(:, 4), labels);
xlabel('Feature 1');
ylabel('Feature 2');
title('Scatter plot of Feature 1 vs Feature 2');

% Visualizing statistics with boxplot
figure;
boxplot(features(:, 1), labels);
xlabel('Label');
ylabel('Feature 1');
title('Box plot of Feature 1 for different labels');

figure;
boxplot(features(:, 2), labels);
xlabel('Label');
ylabel('Feature 2');
title('Box plot of Feature 2 for different labels');


% Identifying important features using fscchi2
[idx, scores] = fscchi2(features, labels);

% Displaying the scores of features
disp('Feature scores:');
disp(scores);

% Visualizing the most important features
important_feature_idx = idx(1:2); % Taking the top 2 important features
figure;
gscatter(features(:, important_feature_idx(1)), features(:, important_feature_idx(2)), labels);
xlabel(['Feature ', num2str(important_feature_idx(1))]);
ylabel(['Feature ', num2str(important_feature_idx(2))]);
title('Scatter plot of the two most important features');

% Identifying feature to distinguish Gear 1 and 2
gear1_2_idx = find(labels == 1 | labels == 2);
gear1_2_features = features(gear1_2_idx, :);
gear1_2_labels = labels(gear1_2_idx);

[idx_gear1_2, scores_gear1_2] = fscchi2(gear1_2_features, gear1_2_labels);

% Displaying the scores for distinguishing Gear 1 and 2
disp('Feature scores for distinguishing Gear 1 and 2:');
disp(scores_gear1_2);


% Visualizing statistics with boxplot
figure;
boxplot(features(:, 21), labels);
xlabel('Label');
ylabel('Feature 1');
title('Box plot of Feature 1 for different labels');


% Building the k-nearest neighbor model with k=1
knn_model = fitcknn(features, labels, 'NumNeighbors', 2);

% Extracting features and labels from testing data
test_features = testing_data(:, 1:end-1);
test_labels = testing_data(:, end);

% Making predictions on the test data
predicted_labels = predict(knn_model, test_features);

% Calculating the proportion of correct predictions
accuracy = sum(predicted_labels == test_labels) / length(test_labels);

% Displaying the accuracy
disp(['Accuracy of the k-nearest neighbor model: ', num2str(accuracy)]);


%% Experimenting with Different Values of k

% Define a range of k values
k_values = 1:10;
accuracy_values = zeros(length(k_values), 1);

for i = 1:length(k_values)
    k = k_values(i);
    % Build the k-nearest neighbor model
    knn_model = fitcknn(features, labels, 'NumNeighbors', k);
    % Make predictions on the test data
    predicted_labels = predict(knn_model, test_features);
    % Calculate accuracy
    accuracy = sum(predicted_labels == test_labels) / length(test_labels);
    accuracy_values(i) = accuracy;
end

% Plot accuracy vs. k values
figure;
plot(k_values, accuracy_values, '-o');
xlabel('Number of Neighbors (k)');
ylabel('Accuracy');
title('Accuracy vs. Number of Neighbors (k)');

%% Step 2: Creating and Interpreting the Confusion Matrix

% Select the best k value based on previous accuracy results, e.g., k=3
best_k = 3;
knn_model = fitcknn(features, labels, 'NumNeighbors', best_k);
predicted_labels = predict(knn_model, test_features);

% Create the confusion matrix
confusionchart(test_labels, predicted_labels);
title('Confusion Matrix for k-NN Model');

%% Step 4: Extracting Observations Causing False Predictions for the Hardest Class

% Assuming class 3 is the hardest to identify based on confusion matrix
hardest_class = 1;

% Find the indices of the misclassified observations for the hardest class
misclassified_indices = find((test_labels == hardest_class) & (predicted_labels ~= hardest_class));

% Extract the misclassified observations
MissClass = test_features(misclassified_indices, :);

% Display the number of misclassified observations
disp(['Number of misclassified observations for class ', num2str(hardest_class), ': ', num2str(length(misclassified_indices))]);

% Display the misclassified observations
disp('Misclassified observations for the hardest class:');
disp(MissClass);


%% Step 1: Plot the Parallel Coordinates for Different Classe
% Standardize the features for better comparison
standardized_features = (features - mean(features)) ./ std(features);

% Combine the standardized features with the labels for plotting
data_with_labels = [standardized_features, labels];

% Plot parallel coordinates with grouping by labels
figure;
parallelcoords(data_with_labels, 'Group', labels, 'Quantile', 0.25, 'Standardize', 'on');
xlabel('Features');
ylabel('Standardized Value');
title('Parallel Coordinates Plot of Features by Class');
