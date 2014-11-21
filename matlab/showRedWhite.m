clear;
img = imread('../img/WallyWembleyCropped.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractWhite(red, green, blue);
redCombined = greatestArray(r, extractRed(red, green, blue));
%[redCombined,g,b]=dilateErode(redCombined, g, b);
redWhite = cat(3, redCombined, g, b); % create image from red only
figure, imshow(img), title('Original') % show original
figure, imshow(redWhite), title('Red and white colors') % show white image