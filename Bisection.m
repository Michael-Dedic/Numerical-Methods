function [i] = Bisection(f,xL,xH,e)

xLower = xL;
xUpper = xH;

i = 0; 

while( abs(xUpper-xLower)>=e)
    
    i = i + 1;
    Y1 = feval(f,xLower);
    Y2 = feval(f,xUpper);
    
    c = (xLower+xUpper)/2;
 
    Y3 = feval(f,c);
    
    if (Y3 == 0 ||  abs(xUpper-xLower)<= e )
        break;
    elseif Y1*Y3<0
        xUpper = c;
    else
        xLower = c;
    end
        
end     





end