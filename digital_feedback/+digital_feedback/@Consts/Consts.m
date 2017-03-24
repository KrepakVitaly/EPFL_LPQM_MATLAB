classdef Consts
    properties (Constant = true)
        DEFAULT_FULL_SCALE = 1.0;
        MIN_FULL_SCALE = 0.2;
        MAX_FULL_SCALE = 3;
        MAX_FULL_SCALE_HIZ = 10;
        
        AIN_IMPEDANCE_HIZ = 0;
        AIN_IMPEDANCE_50  = 1;
        AIN_IMPEDANCE_ORDER = 'HiZ|50Ohm';
        DEFAULT_AIN_IMPEDANCE = 1;
        
        AIN_COUPLING_DC   = 0;
        AIN_COUPLING_AC   = 1;
        AIN_COUPLING_ORDER  = 'DC|AC';
        DEFAULT_AIN_COUPLING = 0;
    end
end
