function out = m_p_(units)
    %m_p_  Mass of a proton
    %      m_p_(units) returns a scalar float of the mass of a proton.
    %      Supported unit sets:
    %      > kg [Default]
    %      > g
    %      > amu
    %Created by Jonathan Lym, University of Delaware. (8/9/2017)
    default = 'kg';    
    switch units
        case 'kg'
            out = 1.6726219e-27;
        case 'g'
            out = 1.6726219e-24;
        case 'amu'
            out = 1.007276466879;
        otherwise
            warning('Unit type %s for m_e_ not supported. Using default unit set %s', units, default)
            out = m_p_(default);
    end
end