CircBinary = imread('circles.png');
CoinGrey = imread('coins.png');
CameGrey = imread('cameraman.tif');
LighColour = imread('lighthouse.png');

[imgHeight, imgWidth] = size(CircBinary);
CircSize = [imgHeight, imgWidth];
disp(CircSize);
[imgHeight, imgWidth] = size(CoinGrey);
CoinSize = [imgHeight, imgWidth];
disp(CoinSize);
[imgHeight, imgWidth] = size(CameGrey);
CameSize = [imgHeight, imgWidth];
disp(CameSize);
[imgHeight, imgWidth] = size(LighColour);
LighSize = [imgHeight, imgWidth];
disp(LighSize);

figure
subplot(2,2,1); % a 2x2 arrangement. First Item.
imshow(CircBinary);
subplot(2,2,2);
imshow(CoinGrey);
subplot(2,2,3);
imshow(CameGrey);
subplot(2,2,4);
imshow(LighColour);

figure
hold on;
imhist(CoinGrey);
imhist(CoinGrey, 128);
hold off;

figure
hold on;
ReCoin = imresize(CoinGrey, .25);
ReReCoin = imresize(ReCoin, 5);
ReCoinBi = imresize(ReCoin, 3, 'bilinear');
ReCoinNe = imresize(ReCoin, 3, 'nearest');

% Histogram equalisation
CoinsEq = histeq(CoinGrey);

subplot(2,3,1);
imshow(CoinGrey);
title('original');
subplot(2,3,2);
imshow(ReCoin);
title('x0.25');
subplot(2,3,3);
imshow(ReReCoin);
title('x0.25 x5');
subplot(2,3,4);
imshow(ReCoinBi);
title('Bilinear x3');
subplot(2,3,5);
imshow(ReCoinNe);
title('Nearest x3');
subplot(2,3,6);
imshow(CoinsEq);
title('Histogram equalisation');
hold off;

figure
hold on;

RGB = LighColour;
HSV = rgb2hsv(LighColour);
YCBCR = rgb2ycbcr(LighColour);
LAB = rgb2lab(LighColour);

redchannel = RGB(:,:,1);
greenchannel = RGB(:,:,2);
bluechannel = RGB(:,:,3);

hue = HSV(:,:,1);
saturation = HSV(:,:,2);
value = HSV(:,:,3);

luminance = YCBCR(:,:,1);
chromablue = YCBCR(:,:,2);
chromared = YCBCR(:,:,3);

l = LAB(:,:,1);
a = LAB(:,:,2);
b = LAB(:,:,3);

subplot(4,3,1);
imshow(redchannel);
title('red channel');
subplot(4,3,2);
imshow(greenchannel);
title('green channel');
subplot(4,3,3);
imshow(bluechannel);
title('blue channel');
subplot(4,3,4);
imshow(hue);
title('hue');
subplot(4,3,5);
imshow(saturation);
title('saturation');
subplot(4,3,6);
imshow(value);
title('value');
subplot(4,3,7);
imshow(luminance);
title('luminance');
subplot(4,3,8);
imshow(chromablue);
title('chroma blue');
subplot(4,3,9);
imshow(chromared);
title('chroma red');
subplot(4,3,10);
imshow(l);
title('l*');
subplot(4,3,11);
imshow(a);
title('a*');
subplot(4,3,12);
imshow(b);
title('b*');

hold off;


