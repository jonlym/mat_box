function out = R_(units)
    %R_  Universal molar gas constant.
    %    R_(units) returns a scalar float of the Universal molar gas constant. 
    %    Supported unit sets: 
    %    > J/mol/K [Default]
    %    > kJ/mol/K
    %    > L kPa/mol/K
    %    > cm3 kPa/mol/K
    %    > m3 Pa/mol/K
    %    > cm3 MPa/mol/K
    %    > m3 bar/mol/K
    %    > L bar/mol/K
    %    > L torr/mol/K
    %    > cal/mol/K
    %    > kcal/mol/K
    %    > L atm/mol/K
    %    > cm3 atm/mol/K
    %    > eV/K (This option implies per molecule. i.e. Uses the value of kb)
    %
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'J/mol/K';
    if nargin == 0
        warning('Unit type not for R_ specified. Using default unit set J/mol/K');
        units = default;
    end

    switch units
        case 'J/mol/K'
            out = 8.3144598;
        case 'kJ/mol/K'
            out = 8.3144598e-3;
        case 'L kPa/mol/K' 
            out = 8.3144598;
        case 'cm3 kPa/mol/K'
            out = 8.3144598e3;
        case 'm3 Pa/mol/K'
            out = 8.3144598;
        case 'L bar/mol/K'
            out = 8.3144598e-2;
        case 'L torr/mol/K'
            out = 62.363577;
        case 'cal/mol/K'
            out = 1.9872036;
        case 'kcal/mol/K'
            out = 1.9872036e-3;
        case 'L atm/mol/K'
            out = 0.082057338;
        case 'cm3 atm/mol/K'
            out = 82.057338;
        case 'eV/K'
            out = 8.6173303e-5;
        otherwise
            warning('Unit type %s for R_ not supported. Using default unit set %s', units, default)
            out = R_(default);
    end
end