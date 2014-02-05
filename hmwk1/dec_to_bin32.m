function [ b ] = dec_to_bin32( d )

BIAS=1023; %127 for 32 bit;
e=floor(log2(d))
E=BIAS+e %this number convreted to binayr is the e or c


norm=d/pow2(e)
fraction=norm-1
b=[];
s=[0];

i=E;
c=[ ];
for(j=1:11)
    r=floor(mod(i,2));
    c=[r c];
    i=i/2;
end

%mantissa
m=[];

for(i=1:53)
    fraction = fraction * 2;
    whole=0;
    if(fraction>1)
        whole=1;
        fraction=fraction-1; %get fraction part
    end
    m=[m whole];
end

c

b=[s c m]; 


end

