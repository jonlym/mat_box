function out = m_e_(units)
    %m_e_  Mass of an electron
    %      m_e_(units) returns a scalar float of the mass of an electron.
    %      Supported unit sets:
    %      > kg [Default]
    %      > g
    %      > amu
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'kg';    
    switch units
        case 'kg'
            out = 9.10938356e-31;
        case 'g'
            out = 9.10938356e-28;
        case 'amu'
            out = 5.48579909070e-4;
        otherwise
            warning('Unit type %s for m_e_ not supported. Using default unit set %s', units, default)
            out = m_e_(default);
    end
end