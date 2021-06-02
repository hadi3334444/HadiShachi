function dis=IMED(imag1,imag2)
[m,n]=size(imag1);
dis=(sum(sum(power(imag1-imag2,2))))/(m*n);
end