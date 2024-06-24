%% load and show
close all 
clear
figure
Verschlissen = imread("Head_Wear.jpg");
Neu = imread("Head_New.jpg");
imshowpair(Verschlissen,Neu,'montage');
title('Verschlissen und Neu')
%% convert to grayscale
BWL1 = im2gray(Verschlissen);
BWL2 = im2gray(Neu);
figure
imshowpair(BWL1,BWL2,'montage');
title('Verschlissen und Neu BW')

%% show histogramm
figure
imhist(BWL1)
title('Verschlissen')
figure
imhist(BWL2)
title('Neu')


%% search best threshold
%close all

figure
for threshold_Neu = 10:10:100
BN2 = BWL2 >threshold_Neu;
nexttile
radius = 10;
        se = strel('disk',radius);
        closeBW = imclose(BN2,se);
imshow(closeBW)
title(['Threshold Neu = ' num2str(threshold_Neu) 'Radius = ' num2str(radius)])
end


figure
for threshold_Verschlissen = 150:5:180
    BN1 = BWL1>threshold_Verschlissen;
    nexttile
    radius = 10;
    se = strel('disk',radius);
    closeBW = imclose(BN1,se);
    imshow(closeBW)
    title(['Threshold Verschlissen = ' num2str(threshold_Verschlissen) 'Radius = ' num2str(radius)])
end
%% set threshold
threshold_Neu = 100;
threshold_Verschlissen = 160;
BN2 = BWL2 >threshold_Neu;
se = strel('disk',radius);
figure
imshow(BN2)
BN2 = imclose(BN2,se);
BN1 = BWL1>threshold_Verschlissen;
se = strel('disk',radius);
figure
    imshow(BN1)
BN1 = imclose(BN1,se);
figure
    imshow(BN1)
    title(['Threshold Verschlissen = ' num2str(threshold_Verschlissen) ' Radius = ' num2str(radius)])
figure
imshow(BN2)
title(['Threshold Neu = ' num2str(threshold_Neu) ' Radius = ' num2str(radius)])


%% calculate area
w = 35; %mm^2
p_area = (numel(Verschlissen)\w);% area of one pixel
fprintf(' Bohrkopf ist %.2f mm^2 groß',(p_area*(sum(BN2,'all')))) % area of drill in mm^2
fprintf('%.2f mm^2 is verschlissen.', (p_area*(sum(BN1,'all')))) % area of wear in mm^2



