clear;
img = imread('../img/WallyWembley.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractWhite(red, green, blue);
white = cat(3, r, g, b); % create image from red only
figure, imshow(white), title('White colors') % show white image
figure, imshow(img), title('Original') % show original