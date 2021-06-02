function [probabilities,frequencies]=prob(imgmatrix)
[m,n]=size(imgmatrix);
frequencies=zeros(256,1);
for i=1:m
    for j=1:n
        frequencies(imgmatrix(i,j)+1)=frequencies(imgmatrix(i,j)+1)+1;
    end
end
probabilities= frequencies./sum(frequencies);
end