function out = T0_(units)
    %T0_  Normal temperature
    %     T0_(units) returns a scalar float of the normal temperature.
    %     Supported unit sets:
    %     > K [Default]
    %     > C
    %     > F
    %     > R
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'K';    
    switch units
        case 'K'
            out = 298.15;
        case 'C'
            out = 20;
        case 'F'
            out = 68;
        case 'R'
            out = 527.67;
        otherwise
            warning('Unit type %s for T0_ not supported. Using default unit set %s', units, default)
            out = T0_(default);
    end
end