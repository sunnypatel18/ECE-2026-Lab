function keyid = DTMF1key(yy,fs) 
%DTMF1key 
% yy = filtered signal that is guaranteed to contain only one sinusoid 
% 		put the row-filtered signal yyrow in the first column, 
	% 		and the column-filtered signal yycol in the 2nd column 
	% TT = structure containing freqs and key names 
	% omegahats = estimated frequencies 
	% fs = sampling frequency 
	% keyid = detected key 
	% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %RUN THIS CODE
    
% 	fs=4000;
% 	col_filter=textread('col_filter.txt','%f');
% 	row_filter=textread('row_filter.txt','%f');
% 	[r c]=size(col_filter);
% 	len=r*c;
% 	col_filter=reshape(col_filter,1,len);
% 	row_filter=reshape(row_filter,1,len);
% 
% 
% 
% 	xpx=DTMFdial('A',fs);
% 	yy(:,1)=conv(row_filter,xpx);
% 	yy(:,2)=conv(col_filter,xpx);
% 	keyed=DTMF1key(yy,fs);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	TT.keys = ['1','2','3','A';
               '4','5','6','B';
               '7','8','9','C';
               '*','0','#','D'];
	TT.colTones = [1209,1336,1477,1633];
	TT.rowTones = [697,770,852,941];
	omegahats_r = onefreq( yy(:,1) ); %--input signals are in 
	omegahats_c = onefreq( yy(:,2) ); %--the columns of yy(:,:)
 	%
	% convert digital frequency to analog frequency
	%
	r_freq = omegahats_r*fs/(2*pi);
	c_freq = omegahats_c*fs/(2*pi);
	% 
	% find the location of TT.rowTone that equals r_freq within a tolerance range
	% find the location of TT.colTone that equals c_freq within a tolerance range
	%
	jrow = find(abs(r_freq-TT.rowTones)<0.02*TT.rowTones);
	jcol = find(abs(c_freq-TT.colTones)<0.02*TT.colTones);
	%
	% retrieve the character at the right location in TT.keys
	%
	keyid = TT.keys(jrow,jcol);
	end 
