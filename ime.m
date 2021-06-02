function me=ime(im1,im2)
a=xor(im1,im2);
me=sum(a(:))/numel(a);
end