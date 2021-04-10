function d = betadiv(A,B,beta)

% beta-divergence
%
%   d = betadiv(A,B,beta)
% 
% - a \= 0,1
%   d(x|y) = ( x^a + (a-1)*y^a - a*x*y^(a-1) ) / (a*(a-1))
% - a = 1
%   d(x|y) = x(log(x)-log(y)) + (y-x)  KULLBACK-LEIBLER
% - a = 0
%   d(x|y) = x/y - log(x/y) -1         ITAKURA-SAITO

switch beta
    case 2
        d = sum((A(:)-B(:)).^2)/2;
    case 1
        ind_0 = find(A(:)<=eps);
        ind_1 = 1:length(A(:));
        ind_1(ind_0) = [];
        d = sum( A(ind_1).*log(A(ind_1)./B(ind_1)) - A(ind_1) + B(ind_1) ) + sum(B(ind_0));        
    case 0
        d = sum( A(:)./B(:) - log(A(:)./B(:)) ) - length(A(:));
    otherwise
        d = sum( A(:).^beta + (beta-1)*B(:).^beta - beta*A(:).*B(:).^(beta-1) )/(beta*(beta-1));
end

