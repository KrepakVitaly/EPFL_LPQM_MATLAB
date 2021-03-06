classdef DigitalFeedback < handle
    properties
        SignadyneModule_Instance;
        DigitalFeedbackUI_Instance;
    end;

    methods
        function obj = DigitalFeedback
        % This function runs when the obj is created
            obj.SignadyneModule_Instance = digital_feedback.SignadyneModule(obj);
            obj.DigitalFeedbackUI_Instance = digital_feedback.DigitalFeedbackUI(obj);
            
        end
        
        function delete(obj)
        % This function runs when the obj is closed
            delete(obj.DigitalFeedbackUI_Instance);
            delete(obj.SignadyneModule_Instance);
        end
        
        function WriteDelay(delay)
            disp('WriteDelay');
        end
        
        function WriteFullScale(full_scale)
            disp('WriteFullScale');
        end
        
        function FirmwareLoad(filename)
            disp('FirmwareLoad');
        end
        
        function ForceModuleInit()
            disp('ForceModuleInit');
        end
    end
end
% End of class definition