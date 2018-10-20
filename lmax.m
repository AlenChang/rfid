function [num, index]=lmax(x)
    sign_array(:,1) = [sign(x-0.9);-1];
    sign_array(:,2) = [-1;sign(x-0.9)];
    change_ve = abs(sign_array(:,1) - sign_array(:,2));
    num = sum(change_ve)/2;
    N = length(x);
    index = 0;
    for i=1:1:N
        if (change_ve ~= 0)
            index = [index; i]; 
        end
    end
    index(1)=[];
end