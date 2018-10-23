[m,n] = size(phase_mat);
out_phase = zeros(m,1);
temp = 0;

out_phase(1) = phase_mat(1,1);
last_phase = out_phase(1);
acc_err = zeros(m,1);
for i = 2:m
   last_diff = 2*pi
   for j = 1:n
       diff = phase_mat(i,j)-last_phase
       if (abs(diff) < abs(last_diff))
           temp = phase_mat(i,j)
           last_diff = diff
       end
   end
   
   if (last_diff < pi/6)
       out_phase(i) = temp
       last_phase = temp
       acc_err(i) = last_diff
   else
       out_phase(i) = NaN
       acc_err(i) = NaN
   end
end