clear;
img = imread('../img/WallyWembleyCropped.png'); %Load image into matrix

[red, green, blue] = extractColorChannels(img);
[r, g, b] = extractBlack(red, green, blue);
black = cat(3, r, g, b); % create image from red only
I = im2double(im2bw(black, 0.9));
I = bwmorph(I, 'erode');    % white is dilated
I = bwmorph(I, 'dilate');
figure, imshow(img), title('Original') % show original
figure, imshow(I), title('Black colors') % show black image