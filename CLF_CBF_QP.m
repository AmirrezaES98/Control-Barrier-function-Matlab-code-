function u = CLF_CBF_QP(X,vd,vddot)
    %difine system states
    x1 = X(1);
    x2 = X(2);
    N = 16;
    p = 2;
    v = 4;
    pole = 4;
    alpha =0.01;
    gamma =10;

    h = 1 - (x1^N/p^N+x2^N/v^N);
    a1 = [N*x2^(N-1)/v^N 0];
    b1 = -(N*x1^(N-1)/p^N)*(cos(x1)+x2)-(N*x2^(N-1)/v^N)*x1*x2+alpha*h;
    
    a2 = [cos(x1)+x2+pole*x1-vd -1];
    b2 = -(cos(x1)+x2+pole*x1-vd)*((cos(x1)+x2)*(pole-sin(x1))+x1*x2-vddot)-gamma*(cos(x1)+x2+pole*x1-vd)^2;

    Aqp = [a1;a2];
    bqp = [b1;b2];
 

    s = 100;
    H = [1 0;0 s];
    f = [0;0];
    options = optimoptions('quadprog', 'Display', 'off');
    u = quadprog(H, f, Aqp, bqp, [], [], [-6 -inf], [6 inf], [], options);    u = u(1);
end