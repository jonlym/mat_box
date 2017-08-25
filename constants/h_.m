function out = h_(units, bar)
    %h_  Planck's constant
    %    h_(units) returns a scalar float of the Planck's constant
    %    h_(units, true) returns a scalar float of the Planck's constant
    %    divided by 2*pi
    %    Supported unit sets:
    %    > J s [Default]
    %    > kJ s
    %    > eV s
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'J s';
    if nargin == 0
        warning('Unit type not for R_ specified. Using default unit set J/mol/K');
        units = default;
        bar = false;
    elseif nargin == 1
        bar = false;
    end
    
    switch units
        case 'J s'
            out = 6.626070040e-34;
        case 'kJ s'
            out = 6.626070040e-37;
        case 'eV s'
            out = 4.135667662e-15;
        otherwise
            warning('Unit type %s for h_ not supported. Using default unit set %s', units, default)
            out = h_(default);
    end
    
    if bar
        out = out/(2*pi);
    end
end