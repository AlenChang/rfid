function [output,time_out] = comprss(x,time,coeff)
    num = floor(length(x)/coeff);
    output = x(coeff*(1:num));
    time_out = time(coeff*(1:num));
end