function newLr = learningrate(Lr, t)
%Calculate the new learning rate by using the learning rate decay rule
%newLr : new learning rate (eta(t))
%Lr : Original learning rate 
% t : Training step
tao1 = 1000;
newLr = Lr * exp((-t)/tao1);
end