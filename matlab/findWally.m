clear all; close all; clc;
%nPeaks = 50; img = imread('../img/WallyWembleyCropped.png');
%nPeaks = 200; img = imread('../img/WallyWembley.png');
nPeaks = 200; img = imread('../img/maps_troy.jpg');
eyeballs = eyeballDetection(img, nPeaks)

stripAreas = findStripes(img)

IDX = knnsearch(stripAreas, eyeballs, 'K', 2)

minDist = 999999;
minDistI = 0;
for i=1:size(IDX,1)
    
    dist1 = sqrt((eyeballs(i,2)-stripAreas(IDX(i,1),2))^2 + (eyeballs(i,1)-stripAreas(IDX(i,1),1))^2);
    dist2 = sqrt((eyeballs(i,2)-stripAreas(IDX(i,2),2))^2 + (eyeballs(i,1)-stripAreas(IDX(i,2),1))^2);
    
    dist = dist1 + dist2
    
    if dist < minDist
        minDist = dist;
        minDistI = i;
    end
end

print('===================')
minDist
minDistI

figure, imshow(img), title('Original'), hold on % show original
plot(eyeballs(minDistI,1), eyeballs(minDistI,2), 'o', 'MarkerEdgeColor', 'blue', 'MarkerSize', 70, 'LineWidth', 10);