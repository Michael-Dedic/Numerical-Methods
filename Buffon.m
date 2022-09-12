L=0.9;%length of needle
a=0;%position of first string
b=1;%position of second string
n=100000;%number of interations
theta1=0;%angle bounds
theta2=2*pi;


P=[]; %empty vector which I will append to later
for k=1:20 %for loop running though the Buffon approximation from 1-20
    count=0;%number of hits
    r = (b-a).*rand(n,1) + a;%random positon
    Angle=(theta2-theta1).*rand(n,1)+theta1;%random angle
    for i = 1:n
        position= r(i) + L*cos(Angle(i));% creates a new position by adding the x component of the pin at a random angle to it's initial x value
        if position <=a | position>=b    %checks if the pin crosses a or b
            count=count+1;               %updates count
        end    
        
        
    end

    Pie= 2*L*n/((b-a)*count);%calculates pie
    P=[P;Pie];%appends Pie to the vector P
end
mean(P)%calculates the average of P
std(P)%calculates the standard dev of P


    
    
