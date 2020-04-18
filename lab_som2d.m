function [som,grid] = lab_som2d (trainingData, neuronCountW, neuronCountH, trainingSteps, startLearningRate, startRadius)
% som = lab_som2d (trainingData, neuronCountW, neuronCountH, trainingSteps, startLearningRate, startRadius)
% -- Purpose: Trains a 2D SOM, which consists of a grid of
%             (neuronCountH * neuronCountW) neurons.
%
% -- <trainingData> data to train the SOM with
% -- <som> returns the neuron weights after training
% -- <grid> returns the location of the neurons in the grid
% -- <neuronCountW> number of neurons along width
% -- <neuronCountH> number of neurons along height
% -- <trainingSteps> number of training steps
% -- <startLearningRate> initial learning rate
% -- <startRadius> initial radius used to specify the initial neighbourhood size
%


    [M,N] = size(trainingData);
    Neuron_Weight = randn(neuronCountH*neuronCountW,N); % Weights initialised with Normally(Gaussian) distributed random numberscollapse
    k=1;
    for i=1:neuronCountW
        for j=1:neuronCountH
            grid(k,:) = [i,j]; %Consists of the grid structure of the Neuron Weights
            k=k+1;
        end
    end


    disp(['Start Learning rate' num2str(startLearningRate)]);
    disp(['Start radius' num2str(startRadius)]);

    %Using number of training steps as the termination point, each interval
    %will be counted from the t=0,1,2... till it reaches the max training
    %steps which is passed as a parameter

    for t=0:trainingSteps
        newLr = learningrate(startLearningRate,t);%Calculate the new learning rate by using the learning rate decay rule
        sigma = decayFunc(t, startRadius);%Calculate the new neighbourhood size using the neighbourhood size decay rule
        i = randi(M); %Selecting index (i is used since it is an index; it has to be an integer)
        X = repmat(trainingData(i,:),neuronCountH*neuronCountW,1);  %To select the next input pattern randomly from the dataset; since the nodes are part of the 2d structure the training set is repeated H*W times to create a 2d structure
        [~,index] = min(eucdist(X,Neuron_Weight)); %index of the the minimum euclidean is extracted since we do not need the value but just the index

        for j=1:neuronCountH*neuronCountW
                dist_ik = eucdist(grid(index,:),grid(j,:));%To calculate the distance between winner neuron and neighbour neuron
                h_ik = kernelFunc(dist_ik,sigma);%To calculate the neighbourhood kernel function
                Neuron_Weight(j,:) = Neuron_Weight(j,:) + newLr *h_ik*(trainingData(i,:)-Neuron_Weight(j,:));
        end
        %Please comment this if statement to run the code without this visualisation
        if(mod(t,1000)==0)%This can be modified to see the iteration for a different step number
            lab_vis2d(Neuron_Weight,grid,trainingData),title(['Iteration Number:' num2str(t)]);
            drawnow;
        end
    end
    som = Neuron_Weight;

    disp(['Final Learning rate' num2str(newLr)]);
    disp(['Final radius' num2str(sigma)]);

end
