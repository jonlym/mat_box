function out = kb_(units)
    %kb_  Boltzmann constant
    %     kb_(units) returns a scalar float of the Boltzmann constant.
    %     Default unit set is J/K.
    %     Supported unit sets:
    %     > J/K
    %     > kJ/K
    %     > eV/K
    %     > cal/K
    %     > kcal/K
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'J/K';    
    switch units
        case 'J/K'
            out = 1.38064852e-23;
        case 'kJ/K'
            out = 1.38064852e-26;
        case 'eV/K'
            out = 8.6173303e-5;
        case 'cal/K'
            out = 3.2976230e-24;
        case 'kcal/K'
            out = 3.2976230e-27;
        otherwise
            warning('Unit type %s for kb_ not supported. Using default unit set %s', units, default)
            out = kb_(default);
    end
end