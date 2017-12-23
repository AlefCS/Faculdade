
f = imread("imgs/car_75DPI_Moire.jpeg");
figure(1); imshow(f);
PQ = paddedsize(size(f));
F = fft2(f, PQ(1), PQ(2));

H1 = notch("btw", PQ(1), PQ(2), 15, 60, 80, 4);
H2 = notch("btw", PQ(1), PQ(2), 5, 60, 160, 4);
H3 = notch("btw", PQ(1), PQ(2), 15, -53, 85, 6);
H4 = notch("btw", PQ(1), PQ(2), 6, -53, 167, 4);
H5 = notch("btw", PQ(1), PQ(2), 15, 55, -83, 4);
H6 = notch("btw", PQ(1), PQ(2), 5, 55, -164, 4);
H7 = notch("btw", PQ(1), PQ(2), 15, -58, -76, 6);
H8 = notch("btw", PQ(1), PQ(2), 6, -57, -159, 4);

F2 = H1.*H2.*H3.*H4.*H5.*H6.*H7.*H8.*F;

g = ifft2(F2);
g = uint8(abs(g))(1:size(f, 1), 1:size(f, 2));
figure(2); imshow(g);

%F2 = fftshift(F2);
%F2 = abs(F2);
%F2 = log(F2+1);
%F2 = mat2gray(F2);

%imshow(F2)