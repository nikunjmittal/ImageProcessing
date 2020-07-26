clc;
clear all;
close all;

i = imread('/home/nikunj/Desktop/Parking spot detection images/parking_spot_filled1 - Copy.png');
r = i(:, :, 1);
g = i(:, :, 2);
b = i(:, :, 3);

gray = 0.229*r + 0.587*g + 0.114*b;

i_thresholded = imbinarize(gray,0.47);

SE = strel('disk',2);
dilated = imdilate(i_thresholded,SE);
eroded = imerode(dilated, SE);
ed=edge(eroded,'sobel',0.3);
[centres,radii]=imfindcircles(i,[5 15],'ObjectPolarity','bright')

total_slots = 10;
slots_filled = total_slots - size(radii, 1);
slots_available = size(radii, 1);
fprintf('Total slots: %d\nSlots filled: %d\nSlots available: %d\n', total_slots, slots_filled, slots_available);
figure
imshow(eroded);