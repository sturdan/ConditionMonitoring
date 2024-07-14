% Make sure the .m file is in the same folder as the unziped datasetfolder

% Specify the folder where the text files are located
current_path = pwd;
folderPath = [current_path '\dataset\Pitting_degradation_level_0 (Healthy)'];

% Get a list of all text files in the folder
filePattern = fullfile(folderPath, '*.txt');
txtFiles = dir(filePattern);

% Loop through each file
for k = 1:10
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
    file_data = load(fullFileName);
    % And put data of file name in front
    rows = size(file_data, 1);
    filename_data = repmat(parts, rows, 1);
    filename_data = str2double(filename_data);
    current_data = [file_data filename_data];
     
end

