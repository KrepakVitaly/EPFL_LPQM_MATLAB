classdef DigitalFeedback < handle
    properties
        Aio;
        SDmoduleID;
        FullScale;
        ModuleIsOpened;
        DigitalFeedbackUI_Instance;
    end;

    methods
        function obj = DigitalFeedback
            % This function runs when the obj is created
            ModuleIsOpened = false;
            obj.DigitalFeedbackUI_Instance = digital_feedback.DigitalFeedbackUI(obj);
            
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
        
        function forceModuleInit(obj, ~, ~)
            obj.moduleInit;
        end
        
        function firmwareBrowse(obj, ~, ~)
               [filename, pathname, ~] = uigetfile( ...
                {  '*.sbp','Firmware files (*.sbp)'; ...
                   '*.*',  'All Files (*.*)'}, ...
                   'Select a firmware file', ...
                   'MultiSelect', 'off'); 
               if (filename ~= '')
                   obj.FirmwarePath = strcat(pathname, filename);
                   obj.FirmwarePathEdit.String = obj.FirmwarePath;
               end
        end
        
        function firmwareLoad(obj, ~, ~)
               obj.Aio.FPGAload(obj.FirmwarePathEdit.String);
        end
        
        function sliderChange(obj, ~, ~)
            full_scale = (round(obj.Slider.Value*10)/10);
            
            obj.SliderValue.String = full_scale;
            AIN_IMPEDANCE_50=0;
            AIN_IMPEDANCE_HIZ=1;
            AIN_COUPLING_DC=0;
            AIN_COUPLING_AC=1;
            %obj.Aio.channelInputConfig(0, double fullScale, int impedance, int coupling)
            obj.Aio.channelInputConfig(0, full_scale, AIN_IMPEDANCE_50, AIN_COUPLING_DC)
        end
        
        function writeDelay(obj, ~, ~)
            delay = str2num(obj.DelayEdit.String)*10;
%                    (int moduleID, int port, int* buffer, int nDW, int address, int addressMode, int accessMode);
            obj.Aio.FPGAwritePCport(0, delay, 0, Signadyne.SD_AddressingMode.FIXED, Signadyne.SD_AccessMode.NONDMA);
        end
    end
        
    methods (Access = private)
        moduleInit(obj);
    end
end
% End of class definition