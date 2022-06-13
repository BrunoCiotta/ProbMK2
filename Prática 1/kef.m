function [] = kef
  %Definindo as variaveis que serao utilizadas
  d=0.2;
  L0=0.5;
  h=sqrt(L0^2-d^2);
  M=180+74;
  W=M*9.81;
  k=10000;

  %===== 1 - Encontrando u de equilibrio =====

    %Plotando o grafico
  u=[0:0.001:1.5]; %Intervalo em que o grafico será plotado
  Fr=(W+((2*k*(sqrt((d^2)+(h-u).^2)-L0).*(h-u))./(sqrt((d^2)+(h-u).^2))))/1000; %Definicao da funcao Fr(u)
  plot(u,Fr, 'r-', 'LineWidth', 1.5);
  grid on;
  title('Gráfico 1 - Força Resultante x Deslocamento', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Deslocamento (m)', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Força resultante (kN)', 'FontName', 'Times', 'FontSize', 12)
  figure(1);

    %Encontrando os zeros da funcao
  u_eq=[fzero('apl1',-500), fzero('apl1', 0.4)]


  %===== 2 - Analisando k efetivo =====

    %Plotando o grafico
  u=[0:0.001:0.5]; %Intervalo em que o grafico sera plotado
  k_ef=-(2*k*((sqrt((d^2)+(h-u).^2)-L0).*(h-u))./(u.*(sqrt((d^2)+(h-u).^2)))); %Definicao da funcao de k_ef(u)
  figure(2);
  plot(u,k_ef/1000, 'r-', 'LineWidth', 1.5);
  grid on;
  axis([0 h]);
  title('Gráfico 2 - K eficiente x Deslocamento', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Deslocamento (m)', 'FontName', 'Times', 'FontSize', 12)
  ylabel('K eficiente (kN/m)', 'FontName', 'Times', 'FontSize', 12)

    %Analisando os k_ef no eqilibrio
  k_ef_eq = -(2*k*((sqrt((d^2)+(h-u_eq).^2)-L0).*(h-u_eq))./(u_eq.*(sqrt((d^2)+(h-u_eq).^2))))
end


