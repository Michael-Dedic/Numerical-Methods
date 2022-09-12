n=100000;%number of iterations
x1=0;%bounds of intergal
x2=1;
y1=0;%y bounds
y2=exp(1);
f= @(x) exp(x.^2);%function
P=[];%empty vector which I will append to later
tic
for k=1:20 %for loop running through the MonteCarlo approximation from 1-20
    count=0;
    r = (x2-x1).*rand(n,1) + x1;%random x positon
    y=  (y2-y1).*rand(n,1)+y1;%random y position
    for i=1:n                 %for looping going from 1:n
        if y(i)<f(r(i))        %is the y position less than the function evaluated at the x position
            count=count+1;     %updates count
        end
    end
    I=(count/n)*(x2-x1)*(y2-y1); %approximates integral
    P=[P;I]; %appends I to the initially empty vector P
end
mean(P)%takes mean on P
std(P)  %takes stdev of P
toc