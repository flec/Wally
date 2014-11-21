img = imread('../img/WallyWembleyCropped.png'); %Load image into matrix X
a = zeros(size(img, 1), size(img, 2)); % zeros array
[red, green, blue] = extractColorChannels(img);
redOnly = extractRed(red, green, blue);
redOnly = medfilt2(redOnly, [3,3]); % use median
just_red = cat(3, redOnly, a, a); % create image from red only
figure, imshow(just_red), title('Red colors') % show red image
figure, imshow(img), title('Original') % show original




