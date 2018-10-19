function out_phase = phase_line(phase_mat,fs)
[m,n] = size(phase_mat);
col = 1:n;
tra_t = 1/fs:1/fs:2000/fs;
para = polyfit(tra_t',phase_mat(1:2000,1),1);
out_phase(1:2000) = phase_mat(1:2000,1);
for i=2001:m
    ref = para(1)*i/fs+para(2);
    temp = [abs(phase_mat(i,:) - ref) ; col];
    ph_rank = sortrows(temp',1);
    out_phase(i) = phase_mat(i,ph_rank(1,2));
end
end