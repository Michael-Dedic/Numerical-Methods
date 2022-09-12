function Simp1over3(a,b,n,f); %takes in bounds a and b, n number of segments, and the function f
h=(b-a)/n                     %calculates for h   
sum=f(a)+f(b);                %I'm adding up the first and last terms here because those terms are not multiplied by anything
count=1                       %count variable which I'll use to determine wheather i is even or odd.
 if mod(n,2)==1               %This is where I account for if n is even
     sum= (b-a)*(f(a)+f(a+h))/2 +f(a+h)+f(b) %I'm just adding the trapz part and adjusting our start point for the simps method
     a=a+h
     n=n-1                    % n is now one less
     
     
 end
 
for i=a+h:h:b-h      %simpsons 1/3 method       
    if count==1
        sum=sum + 4*f(i)
        count=count+1
    
    elseif mod(count,2)==0
        sum=sum+2*f(i)
        count=count+1
    
    elseif mod(count,2)==1
        sum=sum+4*f(i)
        count=count+1
    end
end 

 [sum]
   
    I=(b-a)*sum/(3*n) %I is the final value
Abserror= 44.742-I    %44.742 calculated from wolfram
    
    
        

