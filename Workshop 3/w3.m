% Original Picture
car = imread('redcar.jpg');

% Adding noise to the original picture
snp = imnoise(car, 'salt & pepper', 0.02);
gn = imnoise(car, 'gaussian', 0.02);
p = imnoise(car, 'poisson');
s = imnoise(car, 'speckle', 0.02);

% Matrices for filters
empty_kernel = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_kernel = [-1 -2 -1; 0 0 0; 1 3 1];
first_derivitave_x_pos = [0 0 0; -1 0 1; 0 0 0];

% SNP
% 1. channel split
redsnp = snp(:,:,1); % Redchannel
greensnp = snp(:,:,2); % Greenchannel
bluesnp = snp(:,:,3); % Bluechannel
blacksnp = zeros(size(snp,1), size(snp,2), 'uint8');

% 2. mean filter channels
redoutmeansnp = uint8(conv2(redsnp,ones(3)/9));
greenoutmeansnp = uint8(conv2(greensnp,ones(3)/9));
blueoutmeansnp = uint8(conv2(bluesnp,ones(3)/9));

% 3. mean channels recombined
recomsnp = cat(3, redoutmeansnp, greenoutmeansnp, blueoutmeansnp);

% 4. median filter channels
redoutmediansnp = uint8(medfilt2(redsnp));
greenoutmediansnp = uint8(medfilt2(greensnp));
blueoutmediansnp = uint8(medfilt2(bluesnp));

% 5. median channels recombined
recommedsnp = cat(3, redoutmediansnp, greenoutmediansnp, blueoutmediansnp);

% GN
% 1. channel split
redgn = gn(:,:,1); % Redchannel
greengn = gn(:,:,2); % Greenchannel
bluegn = gn(:,:,3); % Bluechannel
blackgn = zeros(size(gn,1), size(gn,2), 'uint8');

% 2. mean filter channels
redoutmeangn = uint8(conv2(redgn,ones(3)/9));
greenoutmeangn = uint8(conv2(greengn,ones(3)/9));
blueoutmeangn = uint8(conv2(bluegn,ones(3)/9));

% 3. mean channels recombined
recomgn = cat(3, redoutmeangn, greenoutmeangn, blueoutmeangn);

% 4. median filter channels
redoutmediangn = uint8(medfilt2(redgn));
greenoutmediangn = uint8(medfilt2(greengn));
blueoutmediangn = uint8(medfilt2(bluegn));

% 5. median channels recombined
recommedgn = cat(3, redoutmediangn, greenoutmediangn, blueoutmediangn);

% P
% 1. channel split
redp = p(:,:,1); % Redchannel
greenp = p(:,:,2); % Greenchannel
bluep = p(:,:,3); % Bluechannel
blackp = zeros(size(p,1), size(p,2), 'uint8');

% 2. mean filter channels
redoutmeanp = uint8(conv2(redp,ones(3)/9));
greenoutmeanp = uint8(conv2(greenp,ones(3)/9));
blueoutmeanp = uint8(conv2(bluep,ones(3)/9));

% 3. mean channels recombined
recomp = cat(3, redoutmeanp, greenoutmeanp, blueoutmeanp);

% 4. median filter channels
redoutmedianp = uint8(medfilt2(redp));
greenoutmedianp = uint8(medfilt2(greenp));
blueoutmedianp = uint8(medfilt2(bluep));

% 5. median channels recombined
recommedp = cat(3, redoutmedianp, greenoutmedianp, blueoutmedianp);

% S
% 1. channel split
reds = s(:,:,1); % Redchannel
greens = s(:,:,2); % Greenchannel
blues = s(:,:,3); % Bluechannel
blacks = zeros(size(s,1), size(s,2), 'uint8');

% 2. mean filter channels
redoutmeans = uint8(conv2(reds,ones(3)/9));
greenoutmeans = uint8(conv2(greens,ones(3)/9));
blueoutmeans = uint8(conv2(blues,ones(3)/9));

% 3. mean channels recombined
recoms = cat(3, redoutmeans, greenoutmeans, blueoutmeans);

% 4. median filter channels
redoutmedians = uint8(medfilt2(reds));
greenoutmedians = uint8(medfilt2(greens));
blueoutmedians = uint8(medfilt2(blues));

% 5. median channels recombined
recommeds = cat(3, redoutmedians, greenoutmedians, blueoutmedians);

figure
hold on;

% Row 1 Original pictures
subplot(5,5,1);
imshow(car);
title('original');
subplot(5,5,2);
imshow(snp);
title('salt and pepper 0.02');
subplot(5,5,3);
imshow(gn);
title('gaussian 0.02');
subplot(5,5,4);
imshow(p);
title('poisson');
subplot(5,5,5);
imshow(s);
title('speckle 0.02');

% Row 2 Red channel unfiltered
subplot(5,5,7);
imshow(redsnp);
title('snp unfiltered');
subplot(5,5,8);
imshow(redgn);
title('gn unfiltered');
subplot(5,5,9);
imshow(redp);
title('p unfiltered');
subplot(5,5,10);
imshow(reds);
title('s unfiltered');

% Row 3 Red channel mean filtered
subplot(5,5,12);
imshow(redoutmeansnp);
title('snp mean filter');
subplot(5,5,13);
imshow(redoutmeangn);
title('gn mean filter');
subplot(5,5,14);
imshow(redoutmeanp);
title('p mean filter');
subplot(5,5,15);
imshow(redoutmeans);
title('s mean filter');

% Row 4 Red channel median filtered
subplot(5,5,17);
imshow(redoutmediansnp);
title('snp median filter');
subplot(5,5,18);
imshow(redoutmediangn);
title('gn median filter');
subplot(5,5,19);
imshow(redoutmedianp);
title('p median filter');
subplot(5,5,20);
imshow(redoutmedians);
title('s median filter');

% Row 5 Red channel median filtered
subplot(5,5,22);
imshowpair(recomsnp, recommedsnp, 'montage');
title('snp mean left | snp median right');
subplot(5,5,23);
imshowpair(recomgn, recommedgn, 'montage');
title('gn mean left | gn median right');
subplot(5,5,24);
imshowpair(recomp, recommedp, 'montage');
title('p mean left | p median right');
subplot(5,5,25);
imshowpair(recoms, recommeds, 'montage');
title('s mean left | s median right');

% Spacers
subplot(5,5,6);
title('red channel unfiltered');
subplot(5,5,11);
title('red channel mean filtered');
subplot(5,5,16);
title('red channel median filtered');
subplot(5,5,21);
title('recombined colour channels');

hold off;


