img = imread('input.jpg');
figure;
imshow(img);

conv_img = rgb2gray(img);
figure;
imshow(conv_img);

[m, n] = size(conv_img);
mirrored_img = zeros(m, n, 'uint8');
for i = 1:m
    for j = 1:n
        mirrored_img(i, j) = conv_img(i, n-j+1);
    end
end
merged_img = zeros(m, 2*n, 'uint8');
merged_img(:, 1:n) = conv_img;
merged_img(:, n+1:end) = mirrored_img;
imshow(merged_img);

imwrite(merged_img, 'output.jpg');

