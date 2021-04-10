clear;

load Hyspex_Madonna
[N_row,N_col,F] = size(im);
N = N_row*N_col;
V = double(reshape(im(:,:,:),N,F)');

K = 3;

W_ini = abs(randn(F,K));
H_ini = abs(randn(K,N));

l_w = 0;
l_h = 0;

%[cost_fro, W_fro, H_fro] = Fro_VS_KL(V, W_ini, H_ini, l_w, l_h, 2);

[cost_kl, W_kl, H_kl] = Fro_VS_KL(V, W_ini, H_ini, l_w, l_h, 1);

figure;
plot([cost_kl(2:1000)'])
legend('Fro Beta divergence')
title('Madonna')
xlabel('Iteration')
ylabel('Values')

