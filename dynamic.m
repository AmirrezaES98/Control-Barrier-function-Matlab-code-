function dxdt = dynamic(X,u)
    % difine dynamic as the sample given
    % x_i = X(i);
    %for instance the third state x3 = X(3)
    x1 = X(1);
    x2 = X(2);
    dx1dt = cos(x1)+x2;
    dx2dt = x2*x1+u;
    dxdt = [dx1dt; dx2dt];
end