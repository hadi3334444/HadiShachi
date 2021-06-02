function [ss,st,sr,sma]=shannontsalli(imgmatrix,q,frequencies)
[m,n]=size(imgmatrix);
om=256;
temp=zeros(10,1);
c=1;
for i=1:om
    if frequencies(i) ~= 0
        temp(c) = frequencies(i);
        c=c+1;
    end
end
probabilities= temp./sum(temp);
s=sum(probabilities.^q);
st=((1-s)/(q-1));%Tsallis entropy
sm=sum(probabilities.*log(probabilities));
ss=-sm;%shannon entropy
sr=(log(s))/(1-q);%Sahoo entropy
sma=(1/(1-q))*log(1-((1-q)*sm));%Nie entropy
end
