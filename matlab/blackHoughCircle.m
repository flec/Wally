clear all; close all; clc;
%img = imread('../img/WallyWembleyCroppedGlasses.png'); %Load image into matrix
img = imread('../img/WallyWembley.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractWhite(red, green, blue, .85);
black = cat(3, r, g, b); % create image from black only
figure, imshow(img), title('Original') % show original

binary = im2double(im2bw(black, .7));
figure, imshow(binary), title('after im2bw') % show original
%binary = bwmorph(binary, 'dilate');
%binary = bwmorph(binary, 'dilate');
%binary = bwmorph(binary, 'erode');
%binary = bwmorph(binary, 'dilate');
%binary = bwmorph(binary, 'erode');
SE = strel('square', 2);
binary=imdilate(binary, SE);
binary=imdilate(binary, SE);

%binary=imerode(binary, SE);
figure, imshow(binary), title('after dilate') % show original

%binary = im2double(bwmorph(binary, 'erode'));
%figure, imshow(binary), title('after erode/dilate') % show original
%binary = medfilt2(binary);
binEdges = edge(binary,'canny');
figure, imshow(binEdges), title('after canny') % show original
radius = 3;
[y0detect,x0detect,H] = HoughCircle(binEdges, radius);

radius2 = 4;
[y0detect2,x0detect2,H2] = HoughCircle(binEdges, radius2);


% Show the hough space
%figure, imshow(H,[],'InitialMagnification','fit');
%xlabel('\theta'), ylabel('\rho');
%title('hough');
%axis on, axis normal, hold on;

% Get the brightes peak
nPeaks = 200;
P = houghpeaks(H, nPeaks);
P2 = houghpeaks(H2, nPeaks);
%x = P(1,1)
%y = P(1,2)  % Get the x & y coords
%plot(x,y,'s','color','red');

% draw the detected circle
figure, imshow(binEdges), hold on;
%figure, imshow(img), title('Original') % show original
title('detected circle'), hold on;
scale = 0.75; % use a scale because it is points and not pixels
i = 1;
while i <= nPeaks
    %P(i,1)
    %P(i,2)
    %%plot(P(i,1), P(i,2), 'o', 'MarkerSize', radius * 2 * scale, 'MarkerEdgeColor', 'red');
    j=1;
    while j <= nPeaks
        dist = sqrt((P(i,2)-P2(j,2))^2 + (P(i,1)-P2(j,1))^2);
        if dist > 8 && dist < 16
            plot(P(i,2), P(i,1), '*', 'MarkerEdgeColor', 'red');
            plot(P2(j,2), P2(j,1), '*', 'MarkerEdgeColor', 'blue');
        end
        j = j+1;
    end
    i = i+1;
end



%figure, imshow(img), title('Original') % show original
%figure, imshow(binary), title('Black colors') % show black image