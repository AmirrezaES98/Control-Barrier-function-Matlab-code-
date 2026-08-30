clc;clear
close all
%% define final and sample time for simoulation
Tf = 80.0;
Ts = 0.01;


n = 2;%number of states
x0 = [0;0];%initial condition

t = 0:Ts:Tf;
samples = length(t);
xref = [0.5*ones(1,(samples-1)/4) 1.2*ones(1,(samples-1)/4) 0.*3*ones(1,(samples-1)/4) -0.9*ones(1,(samples-1)/4) -0.9];

X = zeros(n,samples);
X(:,1) = x0;
flag = 0;
%main loop
for i = 1:length(t)
    u(i) = CLF_CBF_QP(X(:,i),xref(i));
    X(:,i+1) = simo(X(:,i),u(i),Ts);
end
x = X(:,1:end-1);
plot(t,x(1,:))
hold on
plot(t,xref)
grid on