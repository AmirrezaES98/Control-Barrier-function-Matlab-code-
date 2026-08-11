# Control-Barrier-function-Matlab-code-

## background
Consider nonlinear system as follows:
$$
 \dot x = f(x)
$$
and $V(x)$ a lyapounv funtion. If one shows that $\dot V\le -\alpha(V)$ whree $\alpha(.)$ belongs to class $\mathcal{K}$ this will ensure states converge to the origin in state space.

In the following nonlinear affine control system
$$
\dot x=f(x)+g(x)u
$$
if we want to make sure states converge to the origin, we should make sure the following inequality is hold which results $x(t) \rightarrow 0$.
$$ 
\inf \{\dot V\}=\inf \{L_fV+L_gVu\} \le -\alpha(V)
$$
where $L_fV=\frac{\partial V}{\partial x}f$.

- remark: the syntethis above is valid when ever the relative degree is one for the function $V(x)$ like $V(x)=\sum_{i=1}^{n} x_i^2 $
- remark: in many cases the control objective is tracking in these cases the lyapanov function is in the form that when $V(x) \rightarrow 0$ results in tracking. For instance, if $x_1 \rightarrow x_{ref}$ is the control objective we can introduce $V(x)=(x_1-x_{ref})^2$.

In other words we are controling the function $V(x)$ that's why normally this function is called Control Lyapaouv funtion (CLF).

For more detail on this approach you can see [nonlinear systems writen by hassan khalil](https://books.google.com/books/about/Nonlinear_Systems.html?id=t_d1QgAACAAJ).

## Control barrier function
Control barrier function (CBF) is a powerfull method to address safety and constraints in control theory.

This methodology is very similar with lyapanouve funtion. Now consider the following set:
$$
\mathcal{C}=\{x|b(x)\ge0\}$$
it has shown in theory that if the following inequality holds states evolve in the set $\mathcal{C}$.
$$\sup\{\dot b\}=\sup\{L_fb+L_gbu\}\ge \alpha(b)
$$
for proof see [1](https://scholar.google.com/citations?view_op=view_citation&hl=en&user=TjWwqmwAAAAJ&citation_for_view=TjWwqmwAAAAJ:TIZ-Mc8IlK0C).
this inequatility works when the relative degree of function $b$ is one and it is called control barrier function.

Challenges like choosing proper CBF are the same as CLF. For instance, with choosing not a proper one input may become infinity.

In the case that the relative degree of $b(x)$ is $d$ in [2](https://ieeexplore.ieee.org/abstract/document/9516971) the following method is introduced.

Let's define the following functions:
$$
\psi_o(x)=b(x)\\
\psi_1(x)=\dot \psi_0+\alpha_1(\psi_0)\\
.\\
.\\
.\\
\psi_d(x)=\dot\psi_{d-1}+\alpha_d(\psi_{d-1})
$$
where funtions $\alpha_i(.)$ belong to class $\mathcal{K}$. If we ensure that $\psi_d\ge 0$ result in satisfying $b(x)\ge 0$. This methodology is called High order control barrier function. In the former work [3](https://ieeexplore.ieee.org/abstract/document/7524935/) choosed $\alpha_i(.)=\alpha_i\ge 0$ and named it exponential control barrier function.

For formal proves you can see the papers that have been cited here.
## Building the QP for safe control
combination of CLF and CBF results in the following QP:
$$
\min u^TRu+s\delta^2\quad\quad\quad\\
s.t.\quad L_fV+L_gVu\le \delta\\
\psi_d\ge0
$$
the first constraint is for CLF in order to form regulation(or tracking) and the second one is for safety. In this method safety is prioritize over stability, in other words whenever tracking violates the constraints tracking will not be meet by this controller.
The other form of QP is as follows:
$$
\min ||u-u_{nom}||\\
s.t. \quad \psi_d\ge0\quad
$$
where $u_{nom}$ is a control input that satisfy the control objectives.
## Case study
Now we are going to use this methodogoly on the following system
$$
\dot x_1=-x_1+x_2\\
\dot x_2 = x_1x_2+u
$$
we want first state tracks $x_{ref}$.the following $u_{nom}$ results in tracking.
```math
u_{nom}=-x_1x_2+x_{ref}-x_1
```
