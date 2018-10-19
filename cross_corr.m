function output = cross_corr(x,y,fs)
    step=0.001;
    step_n = step*fs;
    N = length(y);
    corr_n = floor(N/(fs*step));
    output = zeros(corr_n,2);
    for i=1:corr_n
       output(i,1) = xcorr(x,y((step_n*(i-1)+1):step_n*i)); 
    end
    output(:,2) = step:step:step*corr_n;

end