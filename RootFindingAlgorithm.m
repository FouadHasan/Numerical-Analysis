%% Newton Raphson Method
clc
clear all

% ezplot('sin(x)+x*cos(x)',[0 2.5]): plot of original function to get a good initial value
% update formula; x(n+1)=x(n)-f(x)/f'(x);
x_init=1.5;
maxIter=10;
eps=1;
x=x_init;
iter=0;

while (eps>1e-5 & iter<maxIter)
    
    x_new=x_init-(sin(x_init)+x_init*cos(x_init))/(2*cos(x_init)-x_init*sin(x_init));
    x=[x;x_new];
    eps=abs(x_new-x_init);
    x_init=x_new;
    iter=iter+1;
end
x


%% Secant Method
clear all
% f(x)=sin(x)+x*cos(x)
% update formula; x(n+1)=x(n)-(f(x(n))*(x(n)-x(n-1)))/(f(x(n))-f(x(n-1)));

x(1)=1.5;
x(2)=1.6;
x(3)=0;
x_roots=[x(1);x(2)];
maxIter=10;
eps=10;
iter=0;

while (eps>1e-5 & iter<maxIter)
    
    x(3)=x(2)-((sin(x(2))+x(2)*cos(x(2)))*(x(2)-x(1)))/((sin(x(2))+x(2)*cos(x(2)))-(sin(x(1))+x(1)*cos(x(1))));
    x_roots=[x_roots;x(3)];
    eps=abs(x(3)-x(2));
    x(1)=x(2);
    x(2)=x(3);
    iter=iter+1;
end
x_roots


%% Bisection Method
clear all
% f(x)=sin(x)+x*cos(x)
% select two values where f(x1)>0 and f(x2)<0
x1=1.5; %f(x1)>0
x2=2.5; %f(x2)<0
x_roots=[x1;x2];
eps=100;

while eps>1e-5
    m=(x1+x2)/2;
    f_m=sin(m)+m*cos(m);
    if f_m>0
        x1=m;
    end
    if f_m<0
        x2=m;
    end
    x_roots=[x_roots;m];
    eps=abs(x1-x2);
end
x=(x1+x2)/2;
x_roots=[x_roots;x]


%% Method of False Position
clear all
% f(x)=sin(x)+x*cos(x)
% select two values where f(x1)>0 and f(x2)<0
x1=1.5; %f(x1)>0
x2=2.5; %f(x2)<0
x_roots=[x1;x2];
eps=100;
iter=0;

while eps>1e-5
    
    f_x1=sin(x1)+x1*cos(x1);
    f_x2=sin(x2)+x2*cos(x2);
    
    x3=(x1*f_x2-x2*f_x1)/(f_x2-f_x1);
    
    f_x3=sin(x3)+x3*cos(x3);
    
    if f_x1*f_x3<0
        x2=x3;
    end
    if f_x2*f_x3<0
        x1=x3;
    end
    x_roots=[x_roots;x3];
    eps(iter+1)=abs(x_roots(end)-x_roots(end-1));
    iter=iter+1;
end
x_roots








