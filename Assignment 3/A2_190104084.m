% ID: 190104084
% Lab group: A2

function gaussian_filtering()
    img = imread('mig29.png'); 
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);
    sigma = input('Input the sigma val: ');
    
    % As 84%4=0, therefore the kernel size is 3x3
    kernel_size = 3;
    kernel = create_gaussian_kernel(kernel_size, sigma);
    filtered_img = apply_gaussian_filter(img, kernel);

    imwrite(uint8(filtered_img), 'output_image.jpg');
    figure;
    subplot(1, 2, 1);
    imshow(uint8(img));
    title('Input Image');
    subplot(1, 2, 2);
    imshow(uint8(filtered_img));
    title('Output Image');
end

function kernel = create_gaussian_kernel(size, sigma)
    [x, y] = meshgrid(floor(-size/2):floor(size/2), floor(-size/2):floor(size/2));
    exp_part = -(x.^2 + y.^2) / (2 * sigma^2);
    kernel = exp(exp_part) / (2 * pi * sigma^2);
    kernel = kernel / sum(kernel(:));
end

function filtered_img = apply_gaussian_filter(img, kernel)
    [img_h, img_w] = size(img);
    [kernel_h, kernel_w] = size(kernel);
    
    pad_h = floor(kernel_h / 2);
    pad_w = floor(kernel_w / 2);
    padded_img = padarray(img, [pad_h, pad_w], 'replicate');
    
    filtered_img = zeros(size(img));
    
    for i = 1:img_h
        for j = 1:img_w
            region = padded_img(i:i+kernel_h-1, j:j+kernel_w-1);
            filtered_value = sum(sum(region .* kernel));
            filtered_img(i, j) = filtered_value;
        end
    end
end
