new_column0 = 0 * ones(size(deg0, 1), 1);
new_column1 = 1 * ones(size(deg1, 1), 1);
new_column2 = 2 * ones(size(deg2, 1), 1);
new_column3 = 3 * ones(size(deg3, 1), 1);
new_column4 = 4 * ones(size(deg4, 1), 1);
new_column6 = 6 * ones(size(deg6, 1), 1);
new_column8 = 8 * ones(size(deg8, 1), 1);

%% section 1 labeling

deg0 = [deg0, new_column0];
deg1 = [deg1, new_column1];
deg2 = [deg2, new_column2];
deg3 = [deg3, new_column3];
deg4 = [deg4, new_column4];
deg6 = [deg6, new_column6];
deg8 = [deg8, new_column8];

%% section shuffel data and take 10% of data deg0
randomRowIndices_deg0 = randperm(size(deg0, 1));
% Take 10% of the shuffled data
n = ceil(0.1 * length(deg0)); % Number of elements to take (ceil to ensure at least one element is taken)
subset = randomRowIndices_deg0(1:n);
shuffeldSubset_deg0 = deg0(subset, :);

%% section shuffel data and take 10% of data deg1
randomRowIndices_deg1 = randperm(size(deg1, 1));
% Take 10% of the shuffled data
n = ceil(0.1 * length(deg1)); % Number of elements to take (ceil to ensure at least one element is taken)
subset = randomRowIndices_deg1(1:n);
shuffeldSubset_deg1 = deg1(subset, :);

%% section shuffel data and take 10% of data deg2
randomRowIndices_deg2 = randperm(size(deg2, 1));
% Take 10% of the shuffled data
n = ceil(0.1 * length(deg2)); % Number of elements to take (ceil to ensure at least one element is taken)
subset = randomRowIndices_deg2(1:n);
shuffeldSubset_deg2 = deg2(subset, :);

%% section shuffel data and take 10% of data deg3
randomRowIndices_deg3 = randperm(size(deg3, 1));
% Take 10% of the shuffled data
n = ceil(0.1 * length(deg3)); % Number of elements to take (ceil to ensure at least one element is taken)
subset = randomRowIndices_deg3(1:n);
shuffeldSubset_deg3 = deg3(subset, :);

%% section shuffel data and take 10% of data deg4
randomRowIndices_deg4 = randperm(size(deg4, 1));
% Take 10% of the shuffled data
n = ceil(0.1 * length(deg4)); % Number of elements to take (ceil to ensure at least one element is taken)
subset = randomRowIndices_deg4(1:n);
shuffeldSubset_deg4 = deg4(subset, :);

%% section shuffel data and take 10% of data deg6
randomRowIndices_deg6 = randperm(size(deg6, 1));
% Take 10% of the shuffled data
n = ceil(0.1 * length(deg6)); % Number of elements to take (ceil to ensure at least one element is taken)
subset = randomRowIndices_deg6(1:n);
shuffeldSubset_deg6 = deg6(subset, :);

%% section shuffel data and take 10% of data deg8
randomRowIndices_deg8 = randperm(size(deg8, 1));
% Take 10% of the shuffled data
n = ceil(0.1 * length(deg8)); % Number of elements to take (ceil to ensure at least one element is taken)
subset = randomRowIndices_deg8(1:n);
shuffeldSubset_deg8 = deg8(subset, :);

%% make One Mat and Shuffel again

shuffeldSubset_degAll = [shuffeldSubset_deg0;
shuffeldSubset_deg1;
shuffeldSubset_deg2;
shuffeldSubset_deg3;
shuffeldSubset_deg4;
shuffeldSubset_deg6;
shuffeldSubset_deg8];

randomRowIndices_degAll = randperm(size(shuffeldSubset_degAll, 1));
shuffeldSubset_degAll = shuffeldSubset_degAll(randomRowIndices_degAll, :);

