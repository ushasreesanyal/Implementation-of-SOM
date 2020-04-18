function som = lab_som (trainingData, neuronCount, trainingSteps, startLearningRate, startRadius)
% som = lab_som (trainingData, neuronCount, trainingSteps, startLearningRate, startRadius)
% -- Purpose: Trains a 1D SOM i.e. A SOM where the neurons are arranged
%             in a single line.
%
% -- <trainingData> data to train the SOM with
% -- <som> returns the neuron weights after training
% -- <neuronCount> number of neurons
% -- <trainingSteps> number of training steps
% -- <startLearningRate> initial learning rate
% -- <startRadius> initial radius used to specify the initial neighbourhood size


% x = trainingData;
% neuronCount=25;
% trainingSteps= 2000;
% startLearningRate=0.1;
% startRadius=25; %Grid radius


    [M, N] = size(trainingData);
    Neuron_Weight = randn(neuronCount,N); %to get the random data

    %Using number of training steps as the termination point, each interval
    %will be counted from the t=0,1,2... till it reaches the max training
    %steps which is passed as a parameter

    disp(['Start Learning rate' num2str(startLearningRate)]);
    disp(['Start radius' num2str(startRadius)]);

    for t = 0:trainingSteps
        newLr = learningrate(startLearningRate,t); %Calculate the new learning rate by using the learning rate decay rule
        sigma = decayFunc(t, startRadius); %Calculate the new neighbourhood size using the neighbourhood size decay rule
        i = randi(M); %Selecting index (i is used since it is an index; it has to be an integer)
        X = repmat(trainingData(i,:),neuronCount,1); %To select the next input pattern randomly from the dataset
        [~,index] = min(eucdist(X,Neuron_Weight)); %To calculate the lattice distance

        for k=1:neuronCount
             dist_ik = abs(index - k);%To calculate the distance between winner neuron and neighbour neuron
             h_ik = kernelFunc(dist_ik,sigma); %To calculate the neighbourhood kernel function
             Neuron_Weight(k,:) = Neuron_Weight(k,:) + newLr * h_ik * (trainingData(i,:)-Neuron_Weight(k,:)); %Update the winner and its neighbors
        end

        %Please comment this if statement to run the code without this visualisation
        if(mod(t,100)==0) %This can be modified to see the iteration for a different step number
            lab_vis(Neuron_Weight,trainingData),title(['Iteration Number:' num2str(t)]);
            drawnow;
        end
    end
    som = Neuron_Weight;
    disp(['Final Learning rate' num2str(newLr)]);
    disp(['Final radius' num2str(sigma)]);

end
