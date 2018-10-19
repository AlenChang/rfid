% clear
close all
% clc
% load('simout')
fc=920.6126e6;
fs=2e6;
delta_T=1/fs;

data = simout.data';
[m,n] = size(data);
time_series_data = reshape(data,[m*n,1]);%complex number
T_end=m*n*delta_T;
t = (0:delta_T:(T_end-delta_T))';

plot_start_time = 0; %seconds
plot_end_time = T_end-delta_T;

start_point = floor(plot_start_time/delta_T+1);
end_point = floor(plot_end_time/delta_T+1);

time_window = 1;
%% 
filter_out = low_pass_filter(time_series_data,fs,200e3,220e3);
time_data_real = real(filter_out);
time_data_imag = imag(filter_out);
time_data_complex=time_series_data;
time_span = t(start_point:end_point);
% ave_filt = 1/20*ones(20,1);
% time_data_complex = conv(ave_filt,time_data_complex);
target_signal_real = time_data_real(start_point:end_point);
%% 


fpass_low = 1e3;
fpass_high = 4e3;
% filter_output = bandpass(time_series_data(start_point:end_point),[fpass_low fpass_high],fs);
% filter_output = bandstop(time_series_data(start_point:end_point),[fpass_low fpass_high],fs);
% filter_output = highpass(time_series_data(start_point:end_point),1000,fs);
%% 
% fft_transform(spectrum_data,fs);
% fft_transform(real(target_signal_complex),fs);

% [~,half_freq]=fft_transform(time_series_data(start_point:end_point),fs);
% index_max = find(abs(half_freq) > (max(abs(half_freq))-1));
% half_freq(1:index_max-1)=[];
% half_freq=[half_freq;zeros(index_max-1,1)];
% output = ifft(half_freq);
% figure
% plot(real(output))


% filt_N = 1;%Define a Gaussian Filter(moving average)
% gauss_fil=1/filt_N*ones(filt_N,1);
% figure
% plot(conv(gauss_fil,atan(imag(target_signal_complex)./real(target_signal_complex))))% Draw phase plot

% figure
% plot(time_span,real(filter_output))
% axis([3 3.3 -1.1 1.1])

% fig = figure;
% fig.Position = get(0,'ScreenSize');
% ax1 = subplot(3,1,1);
% ax2 = subplot(3,1,2);
% ax3 = subplot(3,1,3);
% linkaxes([ax1,ax2,ax3],'x')
% counter=0;
% 
% while(counter<floor(T_end/time_window))
%     plot_start_time = counter*time_window;
%     plot_end_time = plot_start_time + time_window;
%     plot_start = floor(plot_start_time/delta_T+1);
%     plot_end = floor(plot_end_time/delta_T+1);
%     subplot(3,1,1)
%     plot(time_span(plot_start:plot_end),time_data_real(plot_start:plot_end))
%     subplot(3,1,2)
%     plot(time_span(plot_start:plot_end),time_data_imag(plot_start:plot_end))
%     subplot(3,1,3)
%     plot(time_span(plot_start:plot_end),angle(time_series_data(plot_start:plot_end)))
%     pause
%     counter=counter+1;
% end

fig = figure;
fig.Position = get(0,'ScreenSize');
ax1 = subplot(2,1,1);
ax2 = subplot(2,1,2);
linkaxes([ax1,ax2],'x')
counter=0;

while(counter<floor(T_end/time_window))
    plot_start_time = counter*time_window;
    plot_end_time = plot_start_time + time_window;
    plot_start = floor(plot_start_time/delta_T+1);
    plot_end = floor(plot_end_time/delta_T+1);
    subplot(2,1,1)
    plot(time_span(plot_start:plot_end),abs(time_data_complex(plot_start:plot_end)))
    subplot(2,1,2)
    scatter(time_span(plot_start:plot_end),angle(time_series_data(plot_start:plot_end)),3)
    pause
    counter=counter+1;
end







