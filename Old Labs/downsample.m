function wp = downsample(filename, outname, down)


A = imread(filename);
wp = A(1:down:end,1:down:end);
%subplot(1,2,1),imshow(A);
imwrite(wp,outname);
%subplot(1,2,2),imshow(wp);

end


%downsample('lighthouse.png','lighthousedown.png',2);