classdef Gui < handle
    properties
        Figure;                  % Graphics handles
        DelayLabel;
        DelayEdit;
        ForceInitButton;
        WriteDelayButton;
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
    end;

    methods
        function obj = Gui
            obj.uiInit;
            % Load Visual Studio Library
            NET.addAssembly('C:/Program Files (x86)/Signadyne/Libraries/VisualStudio_AnyCPU/Reference Assemblies/VS2008/Signadyne.dll');
            obj.Aio = Signadyne.SD_AIO();
%             obj.moduleInit;
        end
        
        function closeobj(obj,hObject,eventdata)
        % This function runs when the obj is closed
            delete(obj.Figure);
            obj.Aio.close();
        end
        
        function forceModuleInit(obj, eventdata, handles)
            obj.moduleInit;
        end
        
        function writeDelay(obj, eventdata, handles)
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