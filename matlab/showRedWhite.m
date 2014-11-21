clear;
img = imread('../img/WallyWembleyCropped.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractWhite(red, green, blue);
redCombined = greatestArray(r, extractRed(red, green, blue));
redWhite = cat(3, redCombined, g, b); % create image from red only
figure, imshow(redWhite), title('Red and white colors') % show white image
figure, imshow(img), title('Original') % show original