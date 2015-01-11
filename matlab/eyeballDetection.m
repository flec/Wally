function [foundEyeballs] = eyeballDetection(img)

[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractWhite(red, green, blue, .85);
black = cat(3, r, g, b); % create image from white only
figure, imshow(img), title('Original') % show original

binary = im2double(im2bw(black, .7));
figure, imshow(binary), title('after white extraction') % show image after white extraction

% dilate two times
SE = strel('square', 2);
binary=imdilate(binary, SE);
binary=imdilate(binary, SE);
figure, imshow(binary), title('after dilation') % show image after dilation

% canny edge detection
binEdges = edge(binary,'canny');
figure, imshow(binEdges), title('after canny') % show edges

% find circles for left eyeball
radius = 3;
[y0detect,x0detect,H] = HoughCircle(binEdges, radius);

% find circles for right eyeball
radius2 = 4;
[y0detect2,x0detect2,H2] = HoughCircle(binEdges, radius2);


% Show the hough space
figure, imshow(H,[],'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
title('hough space');
axis on, axis normal, hold on;

% Get the hough peaks peak
nPeaks = 50;
P = houghpeaks(H, nPeaks);
P2 = houghpeaks(H2, nPeaks);

% show the image with the canny edges again, but this time with found
% circles marked
figure, imshow(binEdges), hold on;
title('detected eyeballs'), hold on;
scale = 0.75; % use a scale because it is points and not pixels
i = 1;
foundEyeballs=[];
k=1;
while i <= nPeaks
    j=1;
    while j <= nPeaks
        dist = sqrt((P(i,2)-P2(j,2))^2 + (P(i,1)-P2(j,1))^2);
        if dist > 8 && dist < 16
            plot(P(i,2), P(i,1), '*', 'MarkerEdgeColor', 'red');
            plot(P2(j,2), P2(j,1), '*', 'MarkerEdgeColor', 'blue');
            foundEyeballs(k,1) =P(i,2);
            foundEyeballs(k,2) =P(i,1);
            k=k+1;
        end
        j = j+1;
    end
    i = i+1;
end
end