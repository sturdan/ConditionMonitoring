% (1) Make sure the .m file is in the same folder as the dataset-folder
% (2) Run this file from root Folder (ConditionMonitoring)
% (3) Put in the correct folder path
% (4) Run and happy reading files :D

% /TODO prelocate all_data for more performance => not getting slower at the end
% use tic toc prinf to messure perfomance

% Specify the folder where the text files are located
current_path = pwd;

% (3) input the file data
folderPath = [current_path '\project\dataset\Pitting_degradation_level_0 (Healthy)']; 

% Get a list of all text files in the folder
filePattern = fullfile(folderPath, '*.txt');
txtFiles = dir(filePattern);

all_data = [];

% Loop through each file

for k = 1:length(txtFiles)
    %tic;
    % Get the file name
    baseFileName = txtFiles(k).name;
    fullFileName = fullfile(folderPath, baseFileName);
  
    %get parts of filename
    parts = strsplit(baseFileName, '_');
    
    parts{1} = regexprep(parts{1}, '^V', '');
    parts{2} = regexprep(parts{2}, 'N$', '');
    %regexprep = regular expression | alles nach '.' | durch leeren string ersetzen
    parts{3} = regexprep(parts{3}, '\..*', '');
    
    % Read the contents of the file
    file_data = readmatrix(fullFileName);
    %elapsedTime = toc;
    %fprintf('Total processing time: %.2f seconds\n', elapsedTime)

   
    % And put data of file name in front
    parts = str2double(parts);
    rows = size(file_data, 1);
    filename_data = repmat(parts, rows, 1);

    % horizontale acc -  axiale acc - vertikale acc - Tacho - Speed - Newton - Repetition Number
    %tic;
    current_data = [file_data, filename_data];
    all_data = [all_data; current_data];
    %elapsedTime = toc;
    %fprintf('Total processing time: %.2f seconds\n', elapsedTime)
    fprintf('Processing file %d out of %d\n', k, length(txtFiles));
end

