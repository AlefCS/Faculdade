% Antes de tudo vamos carregar a imagem
angio = imread('angiograma-ruido.tif');

% Utilizacao do filtro de mediana
% para remocao do ruido sal e pimenta
angio2 = medfilt2(angio);

% Aplicacao de um filtro laplaciano
filt_lapl = [1 1 1; 1 -8 1; 1 1 1];
angiol = imfilter(angio2, filt_lapl);
angiol= uint8(angiol);

angiol2 = angio2 - angiol;
angiol2 = mat2gray(angiol2);

% Aplicacao de uma correcao gama
% com um filtro de potencia
angiop = uint64(angiol2).^2.5;
angiop = (angiop-min(min(angiop)))*255/(max(max(angiop))-min(min(angiop)));
angiop = uint8(angiop);

imshow(angiop);