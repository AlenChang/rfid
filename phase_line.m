function out_phase = phase_line(phase_mat,fs,idx)
[m,n] = size(phase_mat);
col = 1:n;
tra_t = idx/fs:1/fs:(idx+500)/fs;
para = polyfit(tra_t',phase_mat(idx:(idx+500),1),1);
out_phase = zeros(m,1);
out_phase(1:idx-1) = phase_mat(1:idx-1,1)+2*pi;
counter = 0;
for i=idx:m
    
    if(i>500)
        counter =counter+1;
        if (counter>100)
            para = polyfit((1/fs:1/fs:i/fs)',out_phase(1:i,1),1);
            counter = 0;
        end
    end
    ref = para(1)*i/fs+para(2);
    temp = [abs(phase_mat(i,:) - ref) ; col];
    ph_rank = sortrows(temp',1);
    out_phase(i) = phase_mat(i,ph_rank(1,2));
end
end