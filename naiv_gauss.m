function x = naiv_gauss(A,b);
n = length(A)                 %find the value of n
x = zeros(n,1)                %make a vector of 
for k=1:n-1                   %ending at n-1 since we are not reducing the last column
      for i=k+1:n             %We use k+1 since we have to start from row 2 
           M = A(i,k)/A(k,k); %Finding the multiplier based off of k which keeps track of where the multiplier is at
           for j=k:n          %iterates through the columns
             A(i,j) = A(i,j)-M*A(k,j); %turns the wanted terms to 0 in matrix
           end
           b(i) = b(i)-M*b(k);%applies row operations to the b vector
      end
end
 
x(n) = b(n)/A(n,n);  %solves for the values of x by dividing 
for i=n-1:-1:1       %starts from the last b values and iterates back until it reaches the first term in the b vector
   value = b(i);     %value that the row is equal to
   for j=i+1:n       %goes through all the columns until n is reached
     value = value-A(i,j)*x(j);%subtracting the values from the off diagonals
   end
   x(i) = value/A(i,i);%getting the final solutions of x by dividing the simplified by by the diagonal terms.
end
end