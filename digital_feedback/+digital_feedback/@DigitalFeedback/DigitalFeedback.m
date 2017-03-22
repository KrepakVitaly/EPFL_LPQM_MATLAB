classdef DigitalFeedback < handle
    properties
        Aio;
        SDmoduleID;
        FullScale;
        SignadyneModule_Instance;
        DigitalFeedbackUI_Instance;
    end;

    methods
        function obj = DigitalFeedback
            % This function runs when the obj is created
            obj.DigitalFeedbackUI_Instance = digital_feedback.DigitalFeedbackUI(obj);
            obj.SignadyneModule_Instance = digital_feedback.SignadyneModule(obj);
            
            % Load Visual Studio Library
            NET.addAssembly('C:/Program Files (x86)/Signadyne/Libraries/VisualStudio_AnyCPU/Reference Assemblies/VS2008/Signadyne.dll');
            obj.Aio = Signadyne.SD_AIO();
        end
    end
     
    methods (Access = public)
        function closeobj(obj,~,~)
        % This function runs when the obj is closed
            delete(obj.DigitalFeedbackUI_Instance);
            obj.Aio.close();
        end
    end
        
    methods (Access = public)
        moduleInit(obj);
    end
end
% End of class definition