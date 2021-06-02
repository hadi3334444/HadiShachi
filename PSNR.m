function s=PSNR(in,out)
[m,n]=size(in);
in=double(in);
out=double(out);
mat=pow2(in-out);
mse=(1/(m*n))*sum(sum(mat));
s=10*log10(pow2(255)/mse);

end