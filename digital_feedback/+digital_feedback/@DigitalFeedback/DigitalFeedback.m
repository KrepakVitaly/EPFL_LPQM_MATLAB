classdef DigitalFeedback < handle
    properties
        SignadyneModule_Instance;
        DigitalFeedbackUI_Instance;
    end;

    methods
        function obj = DigitalFeedback
        % This function runs when the obj is created
            obj.DigitalFeedbackUI_Instance = digital_feedback.DigitalFeedbackUI(obj);
            obj.SignadyneModule_Instance = digital_feedback.SignadyneModule(obj);
        end
        
        function delete(obj)
        % This function runs when the obj is closed
            delete(obj.DigitalFeedbackUI_Instance);
            delete(obj.SignadyneModule_Instance);
        end
    end
end
% End of class definition