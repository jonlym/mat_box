function out = c_(units)
    %c_  Speed of light
    %    c_(units) returns a scalar float of the speed of light.
    %    Supported unit sets:
    %    > m/s [Default]
    %    > cm/s
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'm/s';    
    switch units
        case 'm/s'
            out = 299792458;
        case 'cm/s'
            out = 299792458*100;
        otherwise
            warning('Unit type %s for c_ not supported. Using default unit set %s', units, default)
            out = c_(default);
    end
end