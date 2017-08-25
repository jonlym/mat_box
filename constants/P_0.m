function out = P0_(units)
    %P0_  Normal pressure
    %     P0_(units) returns a scalar float of the standard pressure.
    %     Supported unit sets:
    %     > atm [Default]
    %     > bar
    %     > Pa
    %     > kPa
    %     > MPa
    %     > psia
    %     > mmHg
    %     > Torr
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'atm';    
    switch units
        case 'atm'
            out = 1;
        case 'bar'
            out = 1.01325;
        case 'Pa'
            out = 101325;
        case 'kPa'
            out = 101.325;
        case 'MPa'
            out = 0.101325;
        case 'psia'
            out = 14.6959;
        case 'mmHg'
            out = 760;
        case 'Torr'
            out = 760;
        otherwise
            warning('Unit type %s for P0_ not supported. Using default unit set %s', units, default)
            out = P0_(default);
    end
end