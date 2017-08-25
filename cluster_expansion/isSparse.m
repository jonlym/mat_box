function out = isSparse(in, eps)
    switch nargin
        case 1
            %Eps not specified. Using default value of 1e-5
            eps = 1e-5;
        case 2
            %Do nothing
        otherwise
            warning('Too many arguements specified.');
    end
    out = abs(in) > eps;
end