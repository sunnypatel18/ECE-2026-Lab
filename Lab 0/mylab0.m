tt = -0.5 : 0.005 : 0.5;
xx = 2.* cos( 4*2*pi*tt + 0.3);
plot( tt, xx, 'b-', tt, xx, 'r--' ), grid on %<--- plot a sinusioid
      title('TEST PLOT of a SIN WAVE')
      xlabel('TIME (sec)')
      
      
     z= xx(2:2:length(xx))
     total = sum(z)
         
      
