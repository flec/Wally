clear;
img = imread('../img/WallyWembley.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractBlack(red, green, blue);
black = cat(3, r, g, b); % create image from red only

figure, imshow(img), title('Original') % show original
figure, imshow(black), title('Black colors') % show black image