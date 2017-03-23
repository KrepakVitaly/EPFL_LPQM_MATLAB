classdef DigitalFeedbackUI < handle
    % Summary of this class goes here
    %   Detailed explanation goes here
    properties
        Figure;
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
        FirmwarePathLabel;
        FirmwarePathEdit;
        FirmwarePath;
        FirmwareBrowseButton;
        FirmwareLoadStatus;
        SerialNumField;
        SerialNumString;
        Slider;
        SliderValue;
        Parent;
        TGroup;
        TabPhaseShifter;
    end;
    
    methods
        function obj = DigitalFeedbackUI ( parent )
            obj.Parent = parent;
            %% Main figure
            obj.Figure = figure();
            % Main figure parameters
            obj.Figure.DockControls      = 'off';
            obj.Figure.MenuBar           = 'none';
            obj.Figure.NumberTitle       = 'off';
            obj.Figure.Name              = 'Digital feedback controller';
            obj.Figure.ToolBar           = 'auto';
            obj.Figure.Visible           = 'on';
            obj.Figure.Renderer          = 'opengl'; %or 'painters'
            obj.Figure.RendererMode      = 'auto'; %or 'manual'
            obj.Figure.GraphicsSmoothing = 'on';
            obj.Figure.Resize            = 'off';
            obj.Figure.CloseRequestFcn   = @obj.closeobj;
            %% Create the menu
            mh = uimenu(obj.Figure,'Label','Help'); 
%           frh = uimenu(mh,'Label','Variable');                 
            frh = uimenu(mh,'Label','About', 'Callback','disp(''About'')');
%           uimenu(frh,'Label','Name...', 'Callback','disp(''variable'')');
%           uimenu(frh,'Label','Value...', 'Callback','disp(''value'')');
            %% Controlling the hardware
            obj.ForceInitButton = uicontrol(obj.Figure, 'CallBack', @obj.ForceModuleInit);
            obj.ForceInitButton.Style = 'pushbutton';
            obj.ForceInitButton.Units = 'normalized';
            obj.ForceInitButton.FontSize = 12;
            obj.ForceInitButton.String = '<html><center>Find&Init<br>Signadyne Module';
            obj.ForceInitButton.HorizontalAlignment = 'center';
            
            obj.FirmwareLoadButton = uicontrol(obj.Figure, 'CallBack', @obj.FirmwareLoad);
            obj.FirmwareLoadButton.Style = 'pushbutton';
            obj.FirmwareLoadButton.Units = 'normalized';
            obj.FirmwareLoadButton.FontSize = 12;
            obj.FirmwareLoadButton.String = '<html><center>Firmware<br>Load';
            obj.FirmwareLoadButton.HorizontalAlignment = 'center';
            
            obj.FirmwarePathLabel = uicontrol(obj.Figure);
            obj.FirmwarePathLabel.Style = 'text';
            obj.FirmwarePathLabel.Units = 'normalized';
            obj.FirmwarePathLabel.FontSize = 12;
            obj.FirmwarePathLabel.String = 'Firmware path:';
            obj.FirmwarePathLabel.HorizontalAlignment = 'left';

            obj.FirmwareLoadStatus = uicontrol(obj.Figure);
            obj.FirmwareLoadStatus.Style = 'text';
            obj.FirmwareLoadStatus.Units = 'normalized';
            obj.FirmwareLoadStatus.FontSize = 12;
            obj.FirmwareLoadStatus.String = 'Using the preloaded firmware';
            obj.FirmwareLoadStatus.HorizontalAlignment = 'left';
            
            obj.FirmwarePathEdit = uicontrol(obj.Figure);
            obj.FirmwarePathEdit.Style = 'edit';
            obj.FirmwarePathEdit.Units = 'normalized';
            obj.FirmwarePathEdit.FontSize = 12;
            obj.FirmwarePathEdit.String = strcat(pwd, '\firmware_digital_delay_2017-03-09T20_29_58.sbp');
            obj.FirmwarePathEdit.HorizontalAlignment = 'left';
            
            obj.FirmwareBrowseButton = uicontrol(obj.Figure, 'CallBack', @obj.FirmwareBrowse);
            obj.FirmwareBrowseButton.Style = 'pushbutton';
            obj.FirmwareBrowseButton.Units = 'normalized';
            obj.FirmwareBrowseButton.FontSize = 10;
            obj.FirmwareBrowseButton.String = '<html><center>Browse';
            obj.FirmwareBrowseButton.HorizontalAlignment = 'center';
            
            obj.Slider = uicontrol(obj.Figure, 'CallBack', @obj.SliderChange);
            obj.Slider.Style = 'slider';
            obj.Slider.Units = 'normalized';
            obj.Slider.SliderStep = [0.01 0.1];
            obj.Slider.Value = digital_feedback.Consts.DEFAULT_FULL_SCALE;
            obj.Slider.Min = digital_feedback.Consts.MIN_FULL_SCALE;
            obj.Slider.Max = digital_feedback.Consts.MAX_FULL_SCALE;
            
            obj.SliderValue = uicontrol(obj.Figure);
            obj.SliderValue.Style = 'edit';
            obj.SliderValue.Units = 'normalized';
            obj.SliderValue.Enable = 'off';
            obj.SliderValue.FontSize = 12;
            obj.SliderValue.String = obj.Slider.Value;
            obj.SliderValue.HorizontalAlignment = 'left'; 
            %% Create the tabgroup
            obj.TGroup = uitabgroup('Parent', obj.Figure);                     
            obj.TabPhaseShifter = uitab('Parent', obj.TGroup, 'Title', 'Phase shifter');
            tab_fir0 = uitab('Parent', obj.TGroup, 'Title', 'FIR-0');
            tab_fir1 = uitab('Parent', obj.TGroup, 'Title', 'FIR-1'); 
            %% Phase-shift tab
            obj.DelayLabel = uicontrol(obj.TabPhaseShifter);
            obj.DelayLabel.Style = 'text';
            obj.DelayLabel.Units = 'normalized';
            obj.DelayLabel.FontSize = 12;
            obj.DelayLabel.String = 'Enter the delay (ns): 10*';
            obj.DelayLabel.HorizontalAlignment = 'left';
            
            obj.DelayEdit = uicontrol(obj.TabPhaseShifter);
            obj.DelayEdit.Style = 'edit';
            obj.DelayEdit.Units = 'normalized';
            obj.DelayEdit.FontSize = 12;
            obj.DelayEdit.String = '10';
            obj.DelayEdit.HorizontalAlignment = 'left';
            
            obj.WriteDelayButton = uicontrol(obj.TabPhaseShifter, 'CallBack', @obj.WriteDelay);
            obj.WriteDelayButton.Style = 'pushbutton';
            obj.WriteDelayButton.Units = 'normalized';
            obj.WriteDelayButton.FontSize = 12;
            obj.WriteDelayButton.String = '<html><center>Write Delay';
            obj.WriteDelayButton.HorizontalAlignment = 'center';
            %% Panel with hardware information
            font_size_text_panel = 9;
            
            obj.Panel = uipanel('Parent',obj.Figure);
            obj.Panel.FontSize = 14;
            
            obj.ProductNameField = uicontrol('Parent',obj.Panel);
            obj.ProductNameField.Units = 'normalized';
            obj.ProductNameField.FontSize = font_size_text_panel;
            obj.ProductNameField.Style = 'text';
            obj.ProductNameField.String = 'Product Name:';
          
            obj.ProductNameString = uicontrol('Parent',obj.Panel);
            obj.ProductNameString.Units = 'normalized';
            obj.ProductNameString.FontSize = font_size_text_panel;
            obj.ProductNameString.Style = 'text';
            obj.ProductNameString.String = '?';
            
            obj.ModuleCountField = uicontrol('Parent',obj.Panel);
            obj.ModuleCountField.Units = 'normalized';
            obj.ModuleCountField.FontSize = font_size_text_panel;
            obj.ModuleCountField.Style = 'text';
            obj.ModuleCountField.String = 'ModuleCount:';
            
            obj.ModuleCountString = uicontrol('Parent',obj.Panel);
            obj.ModuleCountString.Units = 'normalized';
            obj.ModuleCountString.FontSize = font_size_text_panel;
            obj.ModuleCountString.Style = 'text';
            obj.ModuleCountString.String = '?';

            obj.ChassisField = uicontrol('Parent',obj.Panel);
            obj.ChassisField.Units = 'normalized';
            obj.ChassisField.FontSize = font_size_text_panel;
            obj.ChassisField.Style = 'text';
            obj.ChassisField.String = 'Chassis #:';
            
            obj.ChassisString = uicontrol('Parent',obj.Panel);
            obj.ChassisString.Units = 'normalized';
            obj.ChassisString.FontSize = font_size_text_panel;
            obj.ChassisString.Style = 'text';
            obj.ChassisString.String = '?';
            
            obj.SlotField = uicontrol('Parent',obj.Panel);
            obj.SlotField.Units = 'normalized';
            obj.SlotField.FontSize = font_size_text_panel;
            obj.SlotField.Style = 'text';
            obj.SlotField.String = 'Slot #:';
            
            obj.SlotString = uicontrol('Parent',obj.Panel);
            obj.SlotString.Units = 'normalized';
            obj.SlotString.FontSize = font_size_text_panel;
            obj.SlotString.Style = 'text';
            obj.SlotString.String = '?';
                        
            obj.SerialNumField = uicontrol('Parent',obj.Panel);
            obj.SerialNumField.Units = 'normalized';
            obj.SerialNumField.FontSize = font_size_text_panel;
            obj.SerialNumField.Style = 'text';
            obj.SerialNumField.String = 'Serial Number:';
            
            obj.SerialNumString = uicontrol('Parent',obj.Panel);
            obj.SerialNumString.Units = 'normalized';
            obj.SerialNumString.FontSize = font_size_text_panel;
            obj.SerialNumString.Style = 'text';
            obj.SerialNumString.String = '#?';
            %% Positions of the elements
            % Tab group
            obj.TGroup.Position               = [.005 .405 .995 .595]; %[left bottom width height]
            % Phase-shift tab
            obj.DelayLabel.Position       = [.10 .40 .35 .20]; %[left bottom width height]
            obj.DelayEdit.Position        = [.40 .40 .20 .20]; %[left bottom width height]
            obj.WriteDelayButton.Position = [.70 .30 .20 .40]; %[left bottom width height]
            % Controlling the hardware
            obj.ForceInitButton.Position      = [.205 .205 .20 .20]; %[left bottom width height]
            obj.FirmwareLoadButton.Position   = [.005 .205 .20 .20]; %[left bottom width height]
            obj.FirmwarePathLabel.Position    = [.005 .155 .20 .05]; %[left bottom width height]
            obj.FirmwarePathEdit.Position     = [.205 .155 .64 .05]; %[left bottom width height]
            obj.FirmwareLoadStatus.Position   = [.005 .105 .64 .05]; %[left bottom width height]
            obj.FirmwareBrowseButton.Position = [.845 .155 .15 .05]; %[left bottom width height]
            obj.Slider.Position               = [.415 .250 .40 .05]; %[left bottom width height]
            obj.SliderValue.Position          = [.415 .305 .40 .05]; %[left bottom width height]
            % Status Panel with hardware information
            obj.Panel.Position = [0.005 .005 0.995 .1]; %[left bottom width height]
            obj.ProductNameField.Position  = [0.00 0.5 0.25 0.5]; %[left bottom width height]
            obj.ProductNameString.Position = [0.25 0.5 0.25 0.5]; %[left bottom width height]
            obj.ModuleCountField.Position  = [0.50 0.5 0.25 0.5]; %[left bottom width height]
            obj.ModuleCountString.Position = [0.75 0.5 0.25 0.5]; %[left bottom width height]
            obj.ChassisField.Position    = [0.00 0.00 0.20 0.50]; %[left bottom width height]
            obj.ChassisString.Position   = [0.20 0.00 0.10 0.50]; %[left bottom width height]
            obj.SlotField.Position       = [0.30 0.00 0.15 0.50]; %[left bottom width height]
            obj.SlotString.Position      = [0.45 0.00 0.10 0.50]; %[left bottom width height]
            obj.SerialNumField.Position  = [0.55 0.00 0.20 0.50]; %[left bottom width height]
            obj.SerialNumString.Position = [0.75 0.00 0.20 0.50]; %[left bottom width height]
            
        end
        
        function closeobj(obj,~,~)
        % This function runs when the obj is closed
            delete(obj.Figure);
        end
    end
    
    methods (Access = public)
        function SliderChange(obj, ~, ~)
            full_scale = (round(obj.Slider.Value*10)/10);
            channel = 0;
            err_code = obj.Parent.SignadyneModule_Instance.Aio.channelInputConfig(channel, full_scale,...
                digital_feedback.Consts.AIN_IMPEDANCE_50, digital_feedback.Consts.AIN_COUPLING_DC);
            if (err_code)
                obj.SliderValue.String = obj.Parent.SignadyneModule_Instance.FullScale;
                obj.Slider.Value = obj.Parent.SignadyneModule_Instance.FullScale;
                obj.update();
                errordlg(strcat('AIO module error: ', num2str(err_code)),'Error');
            else
                obj.SliderValue.String = full_scale;
                obj.Parent.SignadyneModule_Instance.FullScale = full_scale;
                obj.update();
            end
        end
        
        function FirmwareBrowse(obj, ~, ~)
               [filename, pathname, ~] = uigetfile( ...
                {  '*.sbp','Firmware files (*.sbp)'; ...
                   '*.*',  'All Files (*.*)'}, ...
                   'Select a firmware file', ...
                   'MultiSelect', 'off');
               
               if (filename)
                   obj.FirmwarePath = strcat(pathname, filename);
                   obj.FirmwarePathEdit.String = obj.FirmwarePath;
               end
        end
        
        function ForceModuleInit(obj, ~, ~)
            obj.Parent.SignadyneModule_Instance.moduleInit;
            
        end
        
        function FirmwareLoad(obj, ~, ~)
               err_code = obj.Parent.SignadyneModule_Instance.Aio.FPGAload(obj.FirmwarePathEdit.String);
               if (err_code == 0)
                   obj.FirmwareLoadStatus.String = 'Firmware loaded sucessfully';
                   obj.FirmwareLoadStatus.ForegroundColor = 'g';
                   obj.update();
               else
                   obj.FirmwareLoadStatus.String = strcat('Firmware was not loaded err_code= ', num2str(err_code));
                   obj.FirmwareLoadStatus.ForegroundColor = 'r';
                   obj.update();
               end
        end
        
        function WriteDelay(obj, ~, ~)
            delay = str2num(obj.DelayEdit.String);
%                    (int moduleID, int port, int* buffer, int nDW, int address, int addressMode, int accessMode);
            err_code = obj.Parent.SignadyneModule_Instance.Aio.FPGAwritePCport(0, delay, 0, Signadyne.SD_AddressingMode.FIXED, Signadyne.SD_AccessMode.NONDMA);
            if (err_code)
                errordlg(strcat('AIO module error: ', num2str(err_code)),'Error');
            end
        end
        
        function update(obj)
            drawnow();
        end
    end
    
end

