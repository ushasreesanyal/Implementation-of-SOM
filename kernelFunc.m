function kernel = kernelFunc(dist_ik, sigma)
%Calculate the neighbourhood kernel function
%kernel: Returns the neighbourhood kernel between two neurons where i is the winner neuron 
kernel = exp(-dist_ik^2/(2*sigma^2));
end