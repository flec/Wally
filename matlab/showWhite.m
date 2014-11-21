clear;
img = imread('../img/WallyWembleyCropped.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractWhite(red, green, blue);
white = cat(3, r, g, b); % create image from red only
figure, imshow(img), title('Original') % show original
figure, imshow(white), title('White colors') % show white image