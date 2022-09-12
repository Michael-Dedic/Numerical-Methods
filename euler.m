tic
yprime= @(t,y) (1+4*t)*y^(1/2); %the differential eqaution
a=0;%interval
b=1;
h=0.00001;%step size

yvals=[1]; %initial value in a vector
count=1;   %couting variable used for the for loop
%Ivals=[];
for i=a:h:b-h %for loop going through the interval in increments of h
   
   Y= yvals(count)+ yprime(i,yvals(count))*h; %euler eqaution which uses the previous Y value in order to calculate the next value with
   count=count+1;    %increasing count
   yvals=[yvals;Y];  %appending the new Y values to the matrix yvals
   %Ivals=[Ivals,i];
end
[Y]
toc   
yvals;  
error= 6.25-Y
    
    