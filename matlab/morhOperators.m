clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.
cd('/home/joschi/Documents/Dokumente/BFH/Matlab/Projekt/')
X = imread('Walter.png'); %Load image into matrix X
I = im2double(X);                  %Convert to doubles [0-1]
imshow(I); title('Original');

I = im2double(im2bw(I, 0.9));
%R8=im2uint8(I);

%I = bwmorph(I, 'bridge');
%figure; imshow(I);
%I = bwmorph(I, 'clean');
%figure; imshow(I);
%I = bwmorph(I, 'close');
%figure; imshow(I);
%I = bwmorph(I, 'bridge');
%figure; imshow(I);
%I = bwmorph(I, 'clean');
%figure; imshow(I);
%I = bwmorph(I, 'close');
%figure; imshow(I);
%I = bwmorph(I, 'diag');
%figure; imshow(I);
%I = bwmorph(I, 'dilate');
%figure; imshow(I);
%I = bwmorph(I, 'erode');
%figure; imshow(I);
%I = bwmorph(I, 'fill');
%figure; imshow(I);
%I = bwmorph(I, 'hbreak');
%figure; imshow(I);
%I = bwmorph(I, 'majority');
%figure; imshow(I);
%I = bwmorph(I, 'open');
%figure; imshow(I);
%I = bwmorph(I, 'remove');
%figure; imshow(I);
%I = bwmorph(I, 'shrink');
%figure; imshow(I);
%I = bwmorph(I, 'skel');
%figure; imshow(I);
%I = bwmorph(I, 'spur');
%figure; imshow(I);
%I = bwmorph(I, 'thicken');
%figure; imshow(I);
%I = bwmorph(I, 'thin');
%figure; imshow(I);
%I = bwmorph(I, 'tophat');
%figure; imshow(I);

