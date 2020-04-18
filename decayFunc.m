function decay = decayFunc(t, sigma)
%Calculate the neighbourhood size decay per training step
%decay: Returns the new decay value (sigma(t))
tao2 =  1000/log(sigma); 
decay = sigma*exp(-t/tao2); 