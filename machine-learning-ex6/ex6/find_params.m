values = [0.01, 0.03, 0.1, 0.3, 1, 3,10, 30];
C = 1;
sigma = 0.3;
error = inf;
for i = 1:size(values,2)
    for j = 1:size(values,2)
        tmp_C = values(i);
        tmp_sigma = values(j);
        model= svmTrain(X, y, tmp_C, @(x1, x2) gaussianKernel(x1, x2, tmp_sigma));
        predictions = svmPredict(model,Xval);
        err = mean(double(predictions ~= yval));
        if err < error
            error = err;
            C = tmp_C;
            sigma = tmp_sigma;
        end
    end
end