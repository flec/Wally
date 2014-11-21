clear;
img = imread('../img/WallyWembleyCropped.png'); %Load image into matrix X
[red, green, blue] = extractColorChannels(img);
a = zeros(size(red)); % zeros array
[r, g, b] = extractRed(red, green, blue);
just_red = cat(3, r, g, b); % create image from red only
figure, imshow(img), title('Original') % show original
figure, imshow(just_red), title('Red colors') % show red image
