function f=apl1(u)
  d=0.2;
  L0=0.5;
  h=sqrt(L0^2-d^2);
  M=180+89;
  W=M*9.81;
  k=10000;
  f=(W+((2*k*(sqrt((d^2)+(h-u).^2)-L0).*(h-u))./(sqrt((d^2)+(h-u).^2))))/1000;
end
