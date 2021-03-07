

% This function calculate the Euclidean distance 

function o = distance(a,b)

for i=1:size(a,1)
    o(1,i)=sqrt((a(i)-b(i))^2);
end
