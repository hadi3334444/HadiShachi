function [t,bpr,img]=meanthresh(imgmatrix)
[m,n]=size(imgmatrix);
t=(sum(sum(imgmatrix)))/(m*n);
img=imgmatrix>t;
bpr=((m*n)-sum(sum(img)))/(m*n);
fprintf("Mean threshold: "+t+"\tBPR="+bpr+"\n");



end