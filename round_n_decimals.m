function out = round_n_decimals(in, n, roundType)
    %Parse inputs
    switch nargin
        case 1
            n = 0;
            roundType = 'round';
        case 2
            roundType = 'round';
        case 3
            
        otherwise
            warning('Incorrect number of arguements');
    end
    %Round the value
    switch roundType
        case 'round'
            out = round(in*10^n)/10^n;
        case 'ceil'
            out = ceil(in*10^n)/10^n;
        case 'floor'
            out = floor(in*10^n)/10^n;
        otherwise
            error('Invalid roundType: %s.', roundType);
    end
end