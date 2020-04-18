PART 1:

Please use the following commands to initialising and create the dataset:

data  = nicering;
data1 = nicesquare;
data2 = niceball;
data3 = ring(5000,0.2,0.5);
data4 = ball(5000,3);

For the 1D experiments, for the first step I have varied the initial learning rate from 0.9 to 0.8 for the nice ring dataset.

som = lab_som (data, 18, 2000, 0.9, 18);
som = lab_som (data, 18, 2000, 0.8, 18);
%Repeat by changing LR by -0.1
som = lab_som (data, 18, 2000, 0.1, 18);

Further, I have kept the initial learning rate constant at 0.1.
For the other datasets, I have used the visualisation in my code to understand the optimal training steps. It is calling lab_vis and lab_vis2d function
within the code for a specific amount of time step.

Please use the below code for each dataset which was created earlier.

som = lab_som (data1, 22, 3000, 0.1, 22); %For nice square

som = lab_som (data2, 19, 2500, 0.1, 19); %For nice ball

som = lab_som (data3, 17, 2500, 0.1, 17); %For ring

som = lab_som (data2, 19, 3000, 0.1, 19); %For ball


For the 2D experiments; in the comment beside each I have added the name of each dataset which it refers to.
Like the previous experiment, I have kept the initial learning rate = 0.1 and with the help of visualisation chose the optimum training step rounded to the next 500s or 1000s.

[som2,grid] = lab_som2d (data, 18, 18, 2000, 0.1, 18); %nice ring
[som2,grid] = lab_som2d (data, 20, 3, 3500, 0.1, 20); %nice ring

[som2,grid] = lab_som2d (data1, 22, 22, 2000, 0.1, 50);%nice square
[som2,grid] = lab_som2d (data1, 5, 5, 2000, 0.1, 50);%nice square

lab_som2d (data2, 19, 19, 2000, 0.1, 19);%nice ball
lab_som2d (data2, 8, 8, 2500, 0.1, 50);%nice ball

lab_som2d (data3, 25, 3, 2000, 0.1, 70);%ring
lab_som2d (data3, 30, 3, 2000, 0.1, 70);%ring
lab_som2d (data3, 30, 5, 2000, 0.1, 70);%ring

lab_som2d (data4, 5, 5, 2000, 0.1, 70);%ball
lab_som2d (data4, 10, 10, 4000, 0.3, 100);%ball
lab_som2d (data4, 10, 10, 12000, 0.1, 100);%ball

PART 2:

To extract features that can be used for training, run the following command:
[imgs,training]=lab_featuresets('x:\My\Path\To\Images\', -1);

som_gui %Graphical Interface to train the SOM

To load the dataset click on SOM->Ws->Select the training data->Load
Click on Initialize
To train: Click on train-> Select Batch Training

Make the necessary changes

Batch training:
Rough
initial radius - 10
final radius - 5
training length - 1000

Finetune
initial radius - 5
final radius - 0.1
training length - 5000


After you have trained your SOM, you should save it to the workspace with the name 'som'
using Load/Save->Save Map.

After saving, you can visualise the U-Matrix for the SOM using the command
som_show(som, 'umat', 'all').

To view the image cluster, use the command:
lab_showsimilar(imgs,training,som.codebook,1)
