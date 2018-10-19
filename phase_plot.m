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

plot_start_time = 1.032; %seconds
plot_end_time = 1.0445;

start_point = floor(plot_start_time/delta_T+1);
end_point = floor(plot_end_time/delta_T+1);

time_data_complex=time_series_data;
time_span = t(start_point:end_point);
data_span = time_data_complex(start_point:end_point);


phase_single = angle(data_span);
phase_mat = [phase_single phase_single-pi phase_single-2*pi phase_single-3*pi phase_single-4*pi phase_single-5*pi phase_single-6*pi phase_single-7*pi phase_single-8*pi phase_single-9*pi];

figure
scatter(time_span,phase_mat(:,1),3)

line_patt = phase_line(phase_mat,fs);
filt_length = 100;
ave_filt=1/filt_length*ones(filt_length,1);
filt_out = conv(line_patt,ave_filt);
tra_t =time_span((filt_length -1):end);
para = polyfit(tra_t',filt_out((filt_length -1):(end+1-filt_length)),1);
y_hat = polyval(para,tra_t);
phase_diff = filt_out((filt_length -1):(end+1-filt_length))'-y_hat;
figure
scatter(tra_t,phase_diff,3)
figure
scatter(time_span,line_patt,3)


