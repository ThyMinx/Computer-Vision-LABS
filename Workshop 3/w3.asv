car = imread('redcar.jpg');
snp = imnoise(car, 'salt & pepper', 0.02);
gn = imnoise(car, 'gaussian', 0.02);
p = imnoise(car, 'poisson');
s = imnoise(car, 'speckle', 0.02);

filt = [-1 0 1];

filtSNP = imfilter(snp, filt, 'conv');

figure
hold on;

subplot(5,2,1);
imshow(car);
title('original');


subplot(5,2,3);
imshow(snp);
title('salt & pepper 0.02');
subplot(5,2,4);
imshow(filtSNP);
title('salt & pepper filtered');


subplot(5,2,5);
imshow(gn);
title('gaussian 0.02');


subplot(5,2,7);
imshow(p);
title('poisson');


subplot(5,2,9);
imshow(s);
title('speckle 0.02');

hold off;


