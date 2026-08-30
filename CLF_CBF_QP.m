function u = CLF_CBF_QP(X,xref)
    %difine system states
    x1 = X(1);
    x2 = X(2);
    alpha1 = 0.4;
    alpha2 = 0.4;
    unom = -x1*x2+xref-x1;
    psi0 = 1-x1^2;
    psi1 = -2*x1*x2+2*x1^2+alpha1*psi0;
    
    aqp = [2*x1 0];
    bqp = -2*(2*x1-x2)*(x2-x1)-2*x2*x1^2+alpha1*(-2*x1*x2+2*x2^2)+alpha2*psi1;
    aeq = [1 1];
    beq = unom;

    H = [0 0;0 1];
    f = [0 0];

    options = optimoptions('quadprog', 'Display', 'off');
    u = quadprog(H, f, aqp, bqp, aeq, beq, [-6 -inf], [6 inf], [], options); 
    u = u(1);
end