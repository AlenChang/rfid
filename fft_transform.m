function [freq_data, half_freq]= fft_transform(X,fs)
N=length(X);
if mod(N,2)==1
    X(1)=[];
    N=N-1;
end
freq_data = fft(X);
freq_x = fs/N*(1:N/2);

figure
plot(freq_x,abs(freq_data(1:N/2))/N)
half_freq = freq_data(1:N/2);
end