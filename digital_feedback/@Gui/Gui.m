classdef Gui < handle
    properties
        Figure;                  % Graphics handles
        DelayLabel;
        DelayEdit;
        ForceInitButton;
        WriteDelayButton;
        FirmwareLoadButton;
        Panel;
        ProductNameString;
        ProductNameField;
        ModuleCountString;
        ModuleCountField;
        SlotString;
        SlotField;
        ChassisString;
        ChassisField;
        SerialNumberString;
        SerialNumberField;
        Aio;
        SDmoduleID;
        FirmwarePathLabel;
        FirmwarePathEdit;
        FirmwarePath;
        FirmwareBrowseButton;
        SerialNumField;
        SerialNumString;
        Slider;
        SliderValue;
        FullScale;
        ModuleIsOpened;
    end;

    methods
        function obj = Gui
            % This function runs when the obj is created
            ModuleIsOpened = false;
            obj.uiInit;
            % Load Visual Studio Library
            NET.addAssembly('C:/Program Files (x86)/Signadyne/Libraries/VisualStudio_AnyCPU/Reference Assemblies/VS2008/Signadyne.dll');
            obj.Aio = Signadyne.SD_AIO();

        end
        
        function closeobj(obj,~,~)
        % This function runs when the obj is closed
            delete(obj.Figure);
            obj.Aio.close();
        end
        
        function forceModuleInit(obj, ~, ~)
            obj.moduleInit;
        end
        
        function firmwareBrowse(obj, ~, ~)
               [filename, pathname, ~] = uigetfile( ...
                {  '*.mat','MAT-files (*.mat)'; ...
                   '*.slx;*.mdl','Models (*.slx, *.mdl)'; ...
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
            full_scale = (round(obj.Slider.Value*10)/10)
            
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
            obj.Aio.FPGAwritePCport(0, delay, 0, Signadyne.SD_AddressingMode.FIXED, Signadyne.SD_AccessMode.NONDMA);
%                    (int moduleID, int port, int* buffer, int nDW, int address, int addressMode, int accessMode);
        end
    end
        
    methods (Access = private)
        moduleInit(obj);
        err_code = uiInit(obj);
    end
end                                                      % End of class definition