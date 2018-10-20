close all
clearvars -except simout
clc
% load('/Users/zhangyongzhao/Desktop/RFID signal/small_gain_tag')
fc=920.6126e6;
fs=2e6;
delta_T=1/fs;

data = simout.data';
[m,n] = size(data);
time_series_data = reshape(data,[m*n,1]);%complex number
T_end=m*n*delta_T;
t = (0:delta_T:(T_end-delta_T))';

plot_start_time = 1; %seconds
plot_end_time = 2;

time_window = 1;
%% 
filter_out = low_pass_filter(time_series_data,fs,80e3,90e3);
time_data_real = real(filter_out);
time_data_imag = imag(filter_out);
time_data_complex=time_series_data;

% ave_filt = 1/20*ones(20,1);
% time_data_complex = conv(ave_filt,time_data_complex);

plot_start = floor(plot_start_time/delta_T+1);
plot_end = floor(plot_end_time/delta_T+1);
sample_data = abs(time_data_complex(floor(1.028/delta_T+1):floor(1.042/delta_T+1)));
data_inter = abs(time_data_complex(plot_start:plot_end));
time_span = t(plot_start:plot_end);

% N = length(data_inter);
% sample_data = [sample_data; zeros(N-length(sample_data),1)];
% output = xcorr(sample_data,data_inter);
% output = output/max(output);
% plot(time_span(plot_start:plot_end),output(1:N))
% hold on
% plot(time_span(plot_start:plot_end),data_inter)


sample_data = flipud(sample_data);
output = conv(sample_data,data_inter);
output = output/max(output);

fig = figure;
set (gca,'position',[0.01,0.05,0.98,0.95] );
set(gcf,'unit','normalized','position',[-0.07,1,1.15,0.4]);
plot(delta_T*(plot_start:(plot_end-1+length(sample_data))),output)
hold on
plot(delta_T*(plot_start:plot_end),data_inter)
move_n = 300;
ave_filt = 1/move_n*ones(move_n,1);
filt_out = conv(ave_filt,output);
plot(delta_T*(plot_start:(plot_end-1+length(sample_data))),filt_out(move_n/2:(end-move_n/2)))

sign_array(:,1) = [sign(filt_out-mean(sample_data));0];
sign_array(:,2) = [0;sign(filt_out-mean(sample_data))];













