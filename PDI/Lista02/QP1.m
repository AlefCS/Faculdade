%% Explicaçao do procedimento
% Como queremos realçar as bordas eh utilizado
% um filtro Gaussiano passa alta, para conseguirmos
% capturar os valores de alta frequencia e amplifi-
% ca-los, pois estes representam mudanças bruscas
% de intensidade na imagem (bordas).
%
% Alem disso, eh aplicada uma equalizaçao de histograma
% histograma para tornar a imagem mais facil de se
% visualizar.

%% Processamento no dominio da frequencia

% Leitura do arquivo da imagem
raiox = imread("imgs/orig_chest_xray.tif");

% Calculo do tamanho da imagem
% com o preenchimento
PQ = paddedsize(size(raiox));

% Aplicaçao da transformada direta
F = fft2(raiox, PQ(1), PQ(2));

% Criaçao do filtro HP Gaussiano
H = hpfilter('gaussian', PQ(1), PQ(2), 40);

% Criaçao da nova imagem, dando
% um maior peso para os elementos
% de alta frequencia
G = (0.5 + 0.75*H).*F;

% Aplicaçao da transformada inversa e conversao de valores
g = ifft2(G);
g = uint8(abs(g));

% Retornando a imagem ao tamanho original (sem preenchimento)
g = g(1:size(raiox,1),1:size(raiox,2));

%% Processamento no dominio do espaço
g2 = histeq(g2);

imshow(g2);