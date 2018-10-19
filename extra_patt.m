plot_start = floor(1/delta_T+1);
plot_end = floor(2/delta_T+1);
sample_data = abs(time_data_complex(floor(1.028/delta_T+1):floor(1.042/delta_T+1)));
data_inter = abs(time_data_complex(plot_start:plot_end));

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


plot(time_span(plot_start:(plot_end-1+length(sample_data))),output)
hold on
plot(time_span(plot_start:plot_end),data_inter)
plot(time_span(plot_start:plot_end),output(length(sample_data):end))
