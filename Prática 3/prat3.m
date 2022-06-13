function [] = prat3

  %Definindo as variaveis do problema
  b=0.2;
  k_min=10;
  dk=50+0.5*74;

  %Preenchendo a matriz de rigidez
  k_n=@(n) (10+dk*exp(-0.2*n));
  k=zeros(10);
  k(1,1)=k_n(1)+k_n(2);
  k(1,2)=-k_n(2);
  for i=2:9
      k(i,i-1)=-k_n(i);
      k(i,i)=k_n(i)+k_n(i+1);
      k(i,i+1)=-k_n(i+1);
  endfor
  k(10,9)=-k_n(10);
  k(10,10)=k_n(10);
  k

  %Definindo as matrizes F e u
  F=zeros(10,1);
  u=zeros(10,1);

  %Primeiro problema
  F(10,1)=0.1;
  F(5,1)=-0.05;
  %u=inv(k)*F
  u=k\F

  figure(1)
  n=[1:10];
  plot(n, u, '-go')
  title('Gráfico 1 - Delocamento x n', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Deslocamento (m)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('n', 'FontName', 'Times', 'FontSize', 12)
  grid on;
  hold on;

  %=== Segundo problema ===
  F_2=zeros(9,1);
  u_2=zeros(9,1);
  k_2=k([1:9], [1:9])

  %u(10,1)=0.03;
  %u(9,1)=0.06;
  F_2(9,1)=k_n(10)*0.03;
  F_2
  u_2=k_2\F_2
  u_2(10, 1) = 0.03;
  plot(n, u_2, '-bo')
  %=============


  end
