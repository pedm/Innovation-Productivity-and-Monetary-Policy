if sum(imag(x_start_unbounded)) ~= 0 || sum(isinf(x_start_unbounded)) ~= 0 || sum(isnan(x_start_unbounded)) ~= 0
    x_start_unbounded
    error('Error: You are using an initial value that lies outside the bounds.')
end