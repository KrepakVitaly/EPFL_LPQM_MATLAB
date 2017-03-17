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
    end;

    methods
        function obj = Gui
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
               obj.FirmwarePath = strcat(pathname, filename);
               obj.FirmwarePathEdit.String = obj.FirmwarePath;
        end
        
        function firmwareLoad(obj, ~, ~)
               obj.Aio.FPGAload(obj.FirmwarePathEdit.String);
        end
        
        function writeDelay(obj, ~, ~)
            delay = str2num(obj.DelayEdit.String)*10;
%             delay = [delay0 delay0 delay0 delay0];
%             pv = libpointer('int32Ptr',delay0);
            obj.Aio.FPGAwritePCport(0, delay, 0, Signadyne.SD_AddressingMode.FIXED, Signadyne.SD_AccessMode.NONDMA);
%                                                              (int moduleID, int port, int* buffer, int nDW, int address, int addressMode, int accessMode);
%             Signadyne.SD_Module_Import.SD_Module_FPGAwritePCport(obj.SDmoduleID, 0, pv, 1, 0, Signadyne.SD_AddressingMode.FIXED, Signadyne.SD_AccessMode.NONDMA );
        end
    end
        
    methods (Access = private)
        moduleInit(obj);
        err_code = uiInit(obj);
    end
end                                                      % End of class definition