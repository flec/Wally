img = imread('../img/WallyWembley.png'); %Load image into matrix X
red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel
a = zeros(size(img, 1), size(img, 2)); % zeros array
greenBlue = greatestArray(green, blue); % get greatest of green and blue
redOnly = greaterThan(red, greenBlue, 2); % get real red values
redOnly = medfilt2(redOnly, [3,3]); % use median
just_red = cat(3, redOnly, a, a); % create image from red only
figure, imshow(just_red), title('Red colors') % show red image
figure, imshow(img), title('Original') % show original




