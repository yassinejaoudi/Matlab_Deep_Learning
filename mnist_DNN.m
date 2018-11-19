clc;
clear;
% Change the filenames if you've saved the files under different names
% On some platforms, the files might be saved as 
% train-images.idx3-ubyte / train-labels.idx1-ubyte
images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');

% We are using display_network from the autoencoder code
disp(images(:,1)); % Show the first 100 images %Each column is image
disp(labels(1:1)); % each row is label. So I have total 60000 labels

% figure                                          % initialize figure
% colormap(gray)                                  % set to grayscale
% for i = 1:36                                    % preview first 36 samples
%     subplot(6,6,i)                              % plot them in 6 x 6 grid
%     digit = reshape(images(:, i), [28,28]);     % row = 28 x 28 image
%     imagesc(digit)                              % show the image
%     title(num2str(labels(i)))                   % show the label
% end
con=1;
%Learning Rate
alpha=0.5;
epoch=0;
while con
    con = 0;
    %Set weights and NN architecture (784, 520, 256, 10)
    %TODO: Fix bias 
    b1 = 0.5;
    for i = 1 : 100
        x = images(:,i);
        y = labels(i);
    end

    W1 = randn(520,784);
    output1 = W1*images(:,1)+ b1;
    for j = 1 : size(output1, 1)
        if output1(j)>0
            output1(j) = 1;
        else
            output1(j) = 0;
        end
    end
    disp('Output for first layer: ');
    disp(output1);

    W2 = randn(256,520);
    output2 = W2*output1+ b1;
    for j = 1 : size(output2, 1)
        if output2(j)>0
            output2(j) = 1;
        else
            output2(j) = 0;
        end
    end
    disp('Output for second layer: ');
    disp(output2);

    W3 = randn(10,256);
    output3 = W3*output2 + b1;
    for j = 1 : size(output3, 1)
        if output3(j)<0
            output3(j) = 0;
        end
    end
    disp('Output for second layer: ');
    disp(output3);
 
 %Check if output class is same as label otherwise start backprop
 out_max = max(output3);
 if out_max ~= y 
 
 % Backpropagation
 
 
% W2 = randn(33120, 1);
% W3 = randm(2560, 1);


