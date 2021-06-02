function [tres,bpr,img]=findimagesegmentation(imgmatrix,q,probabilities)
[m,n]=size(imgmatrix);
om=length(probabilities);
pa=zeros(om,1);
pb=zeros(om,1);
sa=zeros(om,1);
sb=zeros(om,1);
sta=zeros(om,1);
stb=zeros(om,1);
npa=zeros(om,1);
npb=zeros(om,1);
for r=1:length(probabilities)
    for t=1:1:r
        pa(r)=pa(r)+probabilities(t);%sum of PA
    end
    for i=1:1:r
        if pa(r)~=0
            npa(i)=probabilities(i)/pa(r);  %normalizing PA  
        else
            npa(i)=0;
        end
    end
    for j=1:1:r
        sa(r)=sa(r)+(npa(j))^q;
    end
    sta(r)=((1-sa(r))/(q-1));%entropy of PA
  
    for i=r+1:1:length(probabilities)
        pb(r)=pb(r)+probabilities(i);%sum of PB
    end
    for j=r+1:1:length(probabilities)
        if pb(r)~=0
            npb(j)=probabilities(j)/pb(r);% normalizing PB
        else
           npb(j)=0; 
        end
    end
    for j=r+1:1:length(probabilities)
        sb(r)=sb(r)+(npb(j)^q);
    end
    stb(r)=((1-sb(r))/(q-1));%entropy of PB
end
stt=sta+stb+(1-q)*(sta.*stb);%Pseudo additive property to find total entropy

%you can use built in function to find index of maximum
mx=stt(1);
tres=1;
for i=2:om
    if mx<stt(i)
        mx=stt(i);
        tres=i;
    end
end
img= imgmatrix>tres;
bpr=((m*n)-sum(sum(img)))/(m*n);%black pixel ratio

end