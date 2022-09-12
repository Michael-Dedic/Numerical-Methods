tic
f= @(t,y) (1+4*t)*y^(1/2); % function
a=0; %bounds
b=5; %point to be evaluated at
t0=0;
y0=1;
h=0.01;%step size
hvals= zeros(1,b/h);
yvals=zeros(1,b/h);%  vector that I'll be sppending calculated y values to
%yvals=[]
yvals(1)=y0; %setting the first Y value to y0
count=1;     %couting variable
for i = a:h:b-h
    K1=f(i,yvals(count));             %Runge Kutta formula in the for loop
    K2=f(i+h/2,yvals(count)+K1*h/2);
    K3=f(i+h/2,yvals(count)+K2*h/2);
    K4=f(i+h, yvals(count)+K3*h);
    Y= yvals(count)+ (1/6)*(K1+2*K2+2*K3+K4)*h;
    count=count+1;
    yvals(count)=Y;
    hvals(count)=i;
end
[Y]
toc
plot(hvals,yvals)
xlabel('t values over the interval')
ylabel('Value of the equation')
title( 'Value of the function over the interval 0<t<5')
    