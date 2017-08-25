function out = convertUnit(from, to, num)
    %convertUnit  Converts one unit set to another
    %  convertUnit(from, to) converts units 'from' to units 'to'
    %  convertUnit(from, to, num) converts num from units 'from' to units
    %  'to'
    %  Supported Units:
    %  -----------------------------------    
    %  Type    | Symbol    | Unit
    %  -----------------------------------
    %  Energy  |J          | Joules
    %          |kJ         | KiloJoules
    %          |eV         | Electron Volts
    %          |cal        | Calories
    %          |kcal       | Kilocalories
    %          |L atm      | Litre atmospheres
    %  -----------------------------------
    %  Energy/ |J/mol      |Joules per mol
    %  Amount  |kJ/mol     |KiloJoules per mol
    %          |cal/mol    |Calories per mole
    %          |kcal/mol   |Kilocalories per mole
    %          |eV/molecule|eV per molecule
    %  -----------------------------------
    %  Time    |s          | Seconds 
    %          |min        | Minutes
    %          |hr         | Hours
    %  -----------------------------------
    %  Amount  |molecule   | Molecule
    %          |mol        | Moles
    %  -----------------------------------
    %  Temp    |C          | Celcius
    %          |K          | Kelvin
    %  -----------------------------------
    %  Length  |m          | Meter
    %          |cm         | Centimeter
    %          |nm         | Nanometer           
    %          |A          | Anstroms
    %  -----------------------------------
    %  Area    |m2         | Meters Squared
    %          |cm2        | Centimeter Squared
    %          |A2         | Anstroms Squared
    %  -----------------------------------
    %  Volume  |m3         | Meters Cubed
    %          |cm3        | Centimeters Cubed
    %          |mL         | Milliliters
    %          |L          | Liters
    %  -----------------------------------
    %  Mass    |kg         | Kilograms
    %          |g          | Grams
    %          |amu        | Atomic mass units
    %  -----------------------------------
    %  Pressure|Pa         | Pascals
    %          |kPa        | KiloPascals
    %          |MPa        | MegaPascals
    %          |atm        | Atmospheres
    %          |bar        | Bars
    %          |mmHg       | Millimeters of Mercury
    if nargin == 2
        num = 1;
    end
    fromType = getType(from);
    toType = getType(to);
    if fromType ~= toType
        error('%s [Type %s] not compatible with %s [Type %s]', from, fromType, to, toType);
    else
        fromVal = getVal(from);
        toVal = getVal(to);
        if strcmp(fromType, 'temp')
            out = num + toVal - fromVal;
        else
            out = num * toVal/fromVal;
        end
    end        
end

function out = getType(units)
    switch units
        case 'J'
            out = 'energy';
        case 'kJ'
            out = 'energy';
        case 'eV'
            out = 'energy';
        case 'cal'
            out = 'energy';
        case 'kcal'
            out = 'energy';
        case 'L atm'
            out = 'energy';
        case 'J/mol'
            out = 'energy/amount';
        case 'kJ/mol'
            out = 'energy/amount';
        case 'cal/mol'
            out = 'energy/amount';
        case 'kcal/mol'
            out = 'energy/amount';
        case 'eV/molecule'
            out = 'energy/amount';
        case 's'
            out = 'time';
        case 'min'
            out = 'time';
        case 'hr'
            out = 'time';
        case 'molecule'
            out = 'amount';
        case 'mol'
            out = 'amount';
        case 'C'
            out = 'temp';
        case 'K'
            out = 'temp';
        case 'm'
            out = 'length';
        case 'cm'
            out = 'length';
        case 'nm'
            out = 'length';
        case 'A'
            out = 'length';
        case 'm2'
            out = 'area';
        case 'cm2'
            out = 'area';
        case 'A2'
            out = 'area';
        case 'm3'
            out = 'volume';
        case 'cm3'
            out = 'volume';
        case 'mL'
            out = 'volume';
        case 'L'
            out = 'volume';
        case 'kg'
            out = 'mass';
        case 'g'
            out = 'mass';
        case 'amu'
            out = 'mass';
        case 'Pa'
            out = 'pressure';
        case 'kPa'
            out = 'pressure';
        case 'MPa'
            out = 'pressure';
        case 'atm'
            out = 'pressure';
        case 'bar'
            out = 'pressure';
        case 'mmHg'
            out = 'pressure';
        case 'torr'
            out = 'pressure';
        otherwise
            error('Unit %s not supported.', units);
    end
end

function out = getVal(units)
    switch units
        case 'J'
            out = 1;
        case 'kJ'
            out = 1e-3;
        case 'eV'
            out = 6.242e+18;
        case 'cal'
            out = 0.239006;
        case 'kcal'
            out = 0.000239006;
        case 'L atm'
            out = 101.33;
        case 'J/mol'
            out = 1;
        case 'kJ/mol'
            out = 1e-3;
        case 'cal/mol'
            out = 0.239006;
        case 'kcal/mol'
            out = 0.000239006;
        case 'eV/molecule'
            out = 6.242e+18/6.02214086e23;
        case 's'
            out = 1;
        case 'min'
            out = 1/60;
        case 'hr'
            out = 1/3600;
        case 'molecule'
            out = 6.02214086e23;
        case 'mol'
            out = 1;
        case 'C'
            out = 0;
        case 'K'
            out = 273.15;
        case 'm'
            out = 1;
        case 'cm'
            out = 100;
        case 'nm'
            out = 1e9;
        case 'A'
            out = 1e10;
        case 'm2'
            out = 1;
        case 'cm2'
            out = 1e4;
        case 'A2'
            out = 1e20;
        case 'm3'
            out = 1;
        case 'cm3'
            out = 1e6;
        case 'mL'
            out = 1e6;
        case 'L'
            out = 1e3;
        case 'kg'
            out = 1;
        case 'g'
            out = 1e3;
        case 'amu'
            out = 6.022e+26;
        case 'Pa'
            out = 1;
        case 'kPa'
            out = 1e-3;
        case 'MPa'
            out = 1e-6;
        case 'atm'
            out = 9.86923e-6;
        case 'bar'
            out = 1e-5;
        case 'mmHg'
            out = 0.00750062;
        case 'torr'
            out = 0.00750062;
        otherwise
            error('Unit %s not supported.', units);
    end
end