% Note in Matlab inline comments follow the percent sign
% The following Matlab code loads and displays a Binary image
BinaryImage = imread('circles.png');
imshow(BinaryImage);
% The following Malabcode loads and displays a grayscale image
GrayScaleImage = imread('coins.png');
imshow(GrayScaleImage);
GrayScaleImage2 = imread('cameraman.tif');
imshow(GrayScaleImage2);

% The following Matlabcode loads and displays a colour image
ColourImage = imread('lighthouse.png');
imshow(ColourImage);

% note each call to imshow overwrites the displayed image

figure % new firgure - noote not followed by a semi-colon
hold on;
subplot(2,2,1); % define 2 by 2 space and specify 1st quadrant
imshow(BinaryImage);
title('BinaryImage');
subplot(2,2,2); % on 2 by 2 space specify 2nd quadrant
imshow(GrayScaleImage);
title('GrayScaleImage');
subplot(2,2,3); % on 2 by 2 space specify 3rd quadrant
imshow(GrayScaleImage2);
title('GrayScaleImage2');
subplot(2,2,4); % on 2 by 2 space specify 4th quadrant
imshow(ColourImage);
title('ColourImage');
hold off;