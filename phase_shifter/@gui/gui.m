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
        Aou;
    end;

    methods
        function obj = Gui
            obj.uiInit;
            % Load Visual Studio Library
            NET.addAssembly('C:/Program Files (x86)/Signadyne/Libraries/VisualStudio_AnyCPU/Reference Assemblies/VS2008/Signadyne.dll');
            obj.Aou = Signadyne.SD_AOU();
%             obj.moduleInit;
        end
        
        function closeobj(obj,hObject,eventdata)
        % This function runs when the obj is closed
            delete(obj.Figure);
        end
        
        function forceModuleInit(obj, eventdata, handles)
            obj.moduleInit;
        end
        
        function writeDelay(obj, eventdata, handles)
            delay = str2num(obj.DelayEdit.String);
%             disp(delay);
            obj.Aou.writeRegister(0, delay);
        end
    end
        
    methods (Access = private)
        moduleInit(obj);
        err_code = uiInit(obj);
    end
end                                                      % End of class definition