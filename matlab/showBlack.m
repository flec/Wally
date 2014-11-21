clear;
img = imread('../img/WallyWembley.png'); %Load image into matrix
[red, green, blue] = extractColorChannels(img);
red(3,3)
green(3,3)
blue(3,3)
[r, g, b] = extractBlack(red, green, blue);
black = cat(3, r, g, b); % create image from red only

figure, imshow(img), title('Original') % show original
figure, imshow(black), title('Black colors') % show black image