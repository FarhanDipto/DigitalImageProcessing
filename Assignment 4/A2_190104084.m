% ID: 190104084
% Lab group: A2

% task a:
img = imread('cameraman.png');

% task b:
[counts, bins] = imhist(img);

% task c:
total_pixels = numel(img);
pdf = counts / total_pixels;

% task d:
cdf = cumsum(pdf);

% task e:
L = 256;
cdf_scaled = (L - 1) * cdf;

% task f:
cdf_rounded = round(cdf_scaled);

img_eq = cdf_rounded(double(img) + 1);
img_eq = uint8(img_eq);

% task g:
figure;
subplot(2, 2, 1);
imshow(img);
title('Original Image');

subplot(2, 2, 2);
imshow(img_eq);
title('Equalized Image');

% task h:
subplot(2, 2, 3);
imhist(img);
title('Original Histogram');

subplot(2, 2, 4);
imhist(img_eq);
title('Equalized Histogram');
