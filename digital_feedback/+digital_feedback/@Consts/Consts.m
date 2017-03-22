classdef Consts
    properties (Constant = true)
        DEFAULT_FULL_SCALE = 1.0;
        MIN_FULL_SCALE = 0.1;
        MAX_FULL_SCALE = 10;
        
        AIN_IMPEDANCE_50  = 0;
        AIN_IMPEDANCE_HIZ = 1;
        DEFAULT_AIN_IMPEDANCE = 0;
        
        AIN_COUPLING_DC   = 0;
        AIN_COUPLING_AC   = 1;
        DEFAULT_AIN_COUPLING = 0;
    end
end
