clear all; close all; clc;
img = imread('../img/WallyWembley.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
[r1, g1, b1] = extractWhite(red, green, blue, 0.8);
[r2, g2, b2] = extractRed(red, green, blue);
[r, g, b] = greatestRGB(r1, g1, b1, r2, g2, b2);
[r, g, b] = dilateRGB(r, g, b);
redWhite = cat(3, r, g, b); % create image from red only
[rCon, gCon, bCon] = getConnectedRedWhite(r,g,b);
redWhiteConnected = cat(3, rCon, gCon, bCon); % create image from red only
figure, imshow(img), title('Original') % show original
figure, imshow(redWhite), title('Red and white colors'), hold on % show white image
%plot(40, 12, '*', 'MarkerEdgeColor', 'blue');
figure, imshow(redWhiteConnected), title('Red and white colors connected') % red/white connected
