classdef SignadyneModule < handle
    %SIGNADYNEINTERFACE Summary of this class goes here
    %   Detailed explanation goes here
    properties
        Aio;
        SDmoduleID;
        FullScale;
        Parent;
        Impedance;
        Coupling;
        IsModuleOpen;
    end
    
    methods
        function obj = SignadyneModule ( parent )
            obj.Parent = parent;
            obj.FullScale = digital_feedback.Consts.DEFAULT_FULL_SCALE;
            obj.Impedance = digital_feedback.Consts.DEFAULT_AIN_IMPEDANCE;
            obj.Coupling = digital_feedback.Consts.DEFAULT_AIN_COUPLING;
            obj.IsModuleOpen = false;
            % Load Visual Studio Library
            NET.addAssembly('C:/Program Files (x86)/Signadyne/Libraries/VisualStudio_AnyCPU/Reference Assemblies/VS2008/Signadyne.dll');
            obj.Aio = Signadyne.SD_AIO();
        end
        
        function delete(obj)
        % This function runs when the obj is closed
            obj.Aio.close();
        end
    end
    
    methods (Access = public)
        err_code = moduleInit(obj);
    end
end

