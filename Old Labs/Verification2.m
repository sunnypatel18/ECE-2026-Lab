[xx, fs, nbit] = wavread('Lab3voice.wav');



x1 = onecos(25,1, fs, ((length(xx)-1)/fs),1/fs);
x2 = onecos(400,1, fs, ((length(xx)-1)/fs),1/fs);
x3 = onecos(1000,1, fs, ((length(xx)-1)/fs),1/fs);


wavwrite(xx.*x1.',fs,nbit, 'Lab3out1.wav');
wavwrite(xx.*x2.',fs,nbit, 'Lab3out2.wav');
wavwrite(xx.*x3.',fs,nbit, 'Lab3out3.wav');