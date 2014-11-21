clear;
img = imread('../img/WallyWembleyCropped.png'); %Load image into matrix X
[red, green, blue] = extractColorChannels(img);
a = zeros(size(red)); % zeros array
redOnly = extractRed(red, green, blue);
redOnly = medfilt2(redOnly, [3,3]); % use median
just_red = cat(3, redOnly, a, a); % create image from red only
figure, imshow(img), title('Original') % show original
figure, imshow(just_red), title('Red colors') % show red image
