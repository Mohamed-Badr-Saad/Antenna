clear all;
clc;
%%
theta=0:0.01:2*pi;
L=input('enter the length of dipole relative to lampda l = ');
E=(cos((2*pi*L/2).*cos(theta))-cos(2*pi*L/2))./sin(theta);
E=abs(E);
figure;
polar(theta,E);
% Transforming to XYZ (cartersian)
[theta,phi] = meshgrid(0:0.01:pi,0:0.01:2*pi);
E=(cos((2*pi*L/2).*cos(theta))-cos(2*pi*L/2))./sin(theta);
x = E.*sin(theta).*cos(phi);
y = E.*sin(theta).*sin(phi);
z = E.*cos(theta);
figure;
mesh(x,y,z);
%%
theta=0:0.01:2*pi;
d=input('enter d = ');
alpha=input('enter alpha = ');
n=input('enter n = ');
beta=2*pi;
psi=alpha+beta*d.*cos(theta);
AF=sin(n*psi/2)./(n*sin(psi/2));
AF=abs(AF);
figure;
plot(psi,AF)
figure;
polar(theta,AF)
% Transforming to XYZ (cartersian)
[theta,phi] = meshgrid(0:0.01:pi,0:0.01:2*pi);
psi=alpha+beta*d.*cos(theta);
AF=sin(n*psi/2)./(n*sin(psi/2));
AF=abs(AF);
x = AF.*sin(theta).*cos(phi);
y = AF.*sin(theta).*sin(phi);
z = AF.*cos(theta);
figure;
mesh(x,y,z);
%%
theta=0:0.01:2*pi;
d=input('enter d = ');
alpha=input('enter alpha = ');
n=input('enter n = ');
beta=2*pi;
u=(alpha+beta*d.*cos(theta))./2;
AF=cos(u).^(n-1);
AF=abs(AF);
figure;
plot(u,AF)
figure;
polar(theta,AF)
% Transforming to XYZ (cartersian)
[theta,phi] = meshgrid(0:0.01:pi,0:0.01:2*pi);
u=(alpha+beta*d.*cos(theta))./2;
AF=cos(u).^(n-1);
AF=abs(AF);
x = AF.*sin(theta).*cos(phi);
y = AF.*sin(theta).*sin(phi);
z = AF.*cos(theta);
figure;
mesh(x,y,z);
%%
clear all;

d=input('enter d = ');
alpha=input('enter alpha = ');
N=input('enter n = ');
ROdb=input('enter R0 = ');
beta=2*pi;
theta=0:0.01:2*pi;
u=(alpha+beta*d.*cos(theta))./2;
c=chebwin(N,ROdb); 
b=c';
x=mod(N,2);
if x==0
    for i=1:(N/2)
        a(i)=b((N/2)+i);
    end
elseif x~=0
    for i=0:floor(N/2)
        a(1+i)=b(round(N/2)+i); 
    end
end
if x==0
    AF=0;
    for n=1:N/2
        AF=AF+a(n).*cos(((2.*n-1)).*u);
    end
elseif x~=0
    AF=0;
    for n=1:round(N/2) 
        AF=AF+a(n).*cos((2.*(n-1)).*u); 
    end
end
figure;
z=(cosh(acosh(ROdb)/(N-1)))*cos(u);
plot(z,abs(AF))
figure; 
polar(theta,abs(AF));

% Transforming to XYZ (cartersian)
[theta,phi] = meshgrid(0:0.01:pi,0:0.01:2*pi);
u=(alpha+beta*d.*cos(theta))./2;
c=chebwin(N,ROdb); 
b=c';
x=mod(N,2);
if x==0
    for i=1:(N/2)
        a(i)=b((N/2)+i);
    end
elseif x~=0
    for i=0:floor(N/2)
        a(1+i)=b(round(N/2)+i); 
    end
end
if x==0
    AF=0;
    for n=1:N/2
        AF=AF+a(n).*cos(((2.*n-1)).*u);
    end
elseif x~=0
    AF=0;
    for n=1:round(N/2) 
        AF=AF+a(n).*cos((2.*(n-1)).*u); 
    end
end
x = AF.*sin(theta).*cos(phi);
y = AF.*sin(theta).*sin(phi);
z = AF.*cos(theta);
figure;
mesh(x,y,z);
