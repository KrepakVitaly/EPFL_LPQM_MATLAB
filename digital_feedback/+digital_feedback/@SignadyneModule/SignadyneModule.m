classdef SignadyneModule
    %SIGNADYNEINTERFACE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Aio;
        SDmoduleID;
        FullScale;
        Parent;
    end
    
    methods
        function obj = SignadyneModule ( parent )
            obj.Parent = parent;
        end
    end
    
end

