function [tres,bpr,img]=findimagesegmentationyanmas(imgmatrix,q,probabilities)
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
            npa(i)=probabilities(i)/pa(r);    %normalizing PA 
        else
            npa(i)=0;
        end
    end
    for j=1:1:r
        if (npa(j)~=0)
            sa(r)=sa(r)+npa(j)*log(npa(j));
        end
    end
    sta(r)=(1/(1-q))*log(1-((1-q)*sa(r)));%entropy of PA
  
    for i=r+1:1:length(probabilities)
        pb(r)=pb(r)+probabilities(i);%sum of PB
    end
    for j=r+1:1:length(probabilities)
        if pb(r)~=0
            npb(j)=probabilities(j)/pb(r);%normalizing PB
        else
           npb(j)=0; 
        end
    end
    for j=r+1:1:length(probabilities)
        if(npb(j)~=0)
            sb(r)=sb(r)+npb(j)*log(npb(j));
        end
    end
    stb(r)=(1/(1-q))*log(1-((1-q)*sb(r)));%entropy of PB
end
stt=abs(sta-stb);%differences

%you can use built in function to find index of minimum
mn=stt(1);
tres=1;
for i=2:om
    if mn>stt(i)
        mn=stt(i);
        tres=i;
    end
end
img= imgmatrix>tres;
bpr=((m*n)-sum(sum(img)))/(m*n);%black pixel ratio
end