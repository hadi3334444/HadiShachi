function q=findq(imgmatrix,frequencies,st,ti)
[m,n]=size(imgmatrix);
om=256;
x=0:om-1;
temp=zeros(10,1);
c=0;
for i=1:length(frequencies)
    if frequencies(i) ~= 0
        c=c+1;
        temp(c) = frequencies(i);
    end
end
probabilities= temp./sum(temp);

st=zeros(10,1);
ind=1;
qq=zeros(10,1);
%computing tsallis entropy for q values from -2 upto 10
for q=-2:0.01:10
    s=sum(probabilities.^q);
    st(ind)=((1-s)/(q-1));
    qq(ind)=q;
    ind=ind+1;
end
%Computing maxTsallis entropy
ind=1;
maxTsallis=zeros(10,1);
for q=-2:0.01:10
    maxTsallis(ind)=(1-om^(1-q))/(q-1);
    ind=ind+1;
end
rt = st./maxTsallis;%sq/sqmax according to Rodrigues
mn=rt(1);
loc=1;
for i=2:1:length(rt)
    if rt(i)<mn
        mn=rt(i);
        loc=i;
    end
end
q=-2+0.01*(loc-1);
end