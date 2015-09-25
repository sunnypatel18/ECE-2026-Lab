function f_im(filename)

xim = imread(filename);
figure
imshow(xim);
bdiffh = [1 -1];

yim1 = conv2(double(xim),double(bdiffh)); %%% filter horizontally
figure
imshow(yim1); 

figure

yim2 = conv2(double(xim),double(bdiffh'),'same'); %%% filter vertically
imshow(yim2);


% f_im('CocaCola.bmp')
% f_im('echart.png')
% f_im('Perseverance.png')
end