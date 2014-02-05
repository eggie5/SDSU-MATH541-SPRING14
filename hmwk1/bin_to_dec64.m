function [ d ] = bin_to_dec( b )

    s=b(1);
    c=b(2:12);
    f=b(13:64);
    pow=@(x) 2.^(x); %inline function
    c_tot=sum(pow(10:-1:0).*c);
    f_tot=sum(pow(-1:-1:-52).*f);
    d=(-1)^s * 2^(c_tot - 1023) * (1+f_tot);

end

