function [cost, W, H] = Fro_VS_KL(V, W, H, l_w, l_h, beta)

% Check the speed of Fro NMF and KL NMF

maxout = 1000;

cost = zeros(1, maxout);

cost(1) = betadiv(V, W*H, beta);

fprintf('Initial cost is %f\n', cost(1))

tol = 1e-2;

[F,N] = size(V);

if beta == 2
    for k = 2:maxout
        V_old = W*H;
        
        W = W .* (V * H') ./ (W*(H*H') + 2*l_w*W + eps);
        H = H .* (W' * V) ./ ((W'*W)*H + 2*l_h*H + eps);
        
        V_new = W*H;
        
        cost(k) = betadiv(V, W*H, beta);
        
        stp = (V_old - V_new) ./ V_old;
        stp(isnan(stp)) = 0;
        if norm(stp, 'fro') < tol
            fprintf('Reach stopping criterion at %d\n', k)
            break
        end
    end
    
    %fprintf('Current iteration %d and cost is %.3f\n',k,cost(k))
    
elseif beta == 1
    for k = 2:maxout
        V_old = W*H;
        
        W = W .* ((V ./ (W*H + eps)) * H') ./ (repmat(sum(H,2)',F,1) + eps);
        H = H .* (W' * (V ./ (W*H + eps))) ./ (repmat(sum(W,1)',1,N) + eps);
        
        V_new = W*H;
        
        cost(k) = betadiv(V, W*H, beta);
        
        stp = (V_old - V_new) ./ V_old;
        stp(isnan(stp)) = 0;
        if norm(stp, 'fro') < tol
            fprintf('Reach stopping criterion at %d\n', k)
            break
        end
    end
    %fprintf('Current iteration %d and cost is %.3f\n',k,cost(k))
end

fprintf('Current iteration %d and cost is %.3f\n',k,cost(k))


