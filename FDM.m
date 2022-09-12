tic
h=0.001; %step size
yend=1;  %boundary condition
p=100;   %p value
n=1/h;   %nodes

x=(h:h:yend-h); %creating the positions of the nodes

C=zeros(1,n-1); %creating the Center band of the banded matrix
R=zeros(1,n-2); %creating the right band on the banded matrix
L=zeros(1,n-2); %creating the left band of the banded matrix
for i= 1:length(C) %creating  C values
    C(i)=(-2/h^2 -2*p/x(i)); %formula for u(i)
end

for i=1:length(R) %creating both R and L values
    R(i)=(1/h^2+1/(h*x(i))); %formula for u(i+1)
    L(i)=(1/h^2-1/(h*x(i+1))); %formula for u(i-1)
end



A= sparse(n-1,n-1); %creating a sparse matrix


for i = 1:length(A)  %putting C values in the matrix
    j=i;
    A(i,j)=C(i);
end

count=1;
for i=2:length(A)   %putting L values in the matrix
    
    j=i-1;
    A(i,j)=L(count);
    count=count+1;
end

for i=1:length(A)-1  %putting R values in the matrix
    j=i+1;
    A(i,j)=R(i);
end 

b=zeros(1,n-1);%creating b vector
b(n-1)= (1/h^2+1/(h*x(n-1)))*-yend;

S=A\b' %solving for the unknowns
toc
