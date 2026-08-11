function X_new = simo(X_old,u,ts)
    n = length(X_old);
    [~, sol] = ode45(@(t, x) dynamic(X_old,u), [0, ts], X_old);
    X_new = sol(end, 1:n)';
end