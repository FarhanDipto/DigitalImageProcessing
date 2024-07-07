I = imread('blackpink_jennie.jpg');
K = imfinfo('blackpink_jennie.jpg');

if(K.BitDepth==24)
    I = rgb2gray(I);
end

[row, col] = size(I);
R = uint8(zeros(row, col));

A = Inf;
B = -Inf;
for i = 1:row
    for j = 1:col
        if I(i, j) < A
            A = I(i, j);
        end
        if I(i, j) > B
            B = I(i, j);
        end
    end
end

D = B - A;
M = 255;    

for i = 1:row
    for j = 1:col
        R(i,j) = uint8((((I(i,j) - A) / D) * M ) + A);
    end
end

figure;
subplot(121),imshow(I);
title('Input Image');
subplot(122),imshow(R);
title('Output Image');
