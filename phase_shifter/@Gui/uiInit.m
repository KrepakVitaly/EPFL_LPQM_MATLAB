function err_code = uiInit( obj )
%UIINIT Summary of this function goes here
%   Detailed explanation goes here
            % Main figure
            obj.Figure = figure();
            obj.Figure.DockControls   = 'off';
            obj.Figure.MenuBar        = 'none';
            obj.Figure.NumberTitle    = 'off';
            obj.Figure.Name           = 'Phase-shifter controller';
            obj.Figure.ToolBar        = 'auto';
            obj.Figure.Visible        = 'on';
            obj.Figure.Renderer       = 'opengl'; %or 'painters'
            obj.Figure.RendererMode      = 'auto'; %or 'manual'
            obj.Figure.GraphicsSmoothing = 'on';
            obj.Figure.Resize            = 'off';
            obj.Figure.CloseRequestFcn   = @obj.closeobj;
            
            obj.DelayLabel = uicontrol(obj.Figure);
            obj.DelayLabel.Style = 'text';
            obj.DelayLabel.Units = 'normalized';
            obj.DelayLabel.FontSize = 12;
            obj.DelayLabel.String = 'Enter the delay';
            obj.DelayLabel.HorizontalAlignment = 'left';
            obj.DelayLabel.Position = [.2 .7 .2 .05]; %[left bottom width height]
            
            obj.DelayEdit = uicontrol(obj.Figure);
            obj.DelayEdit.Style = 'edit';
            obj.DelayEdit.Units = 'normalized';
            obj.DelayEdit.FontSize = 12;
            obj.DelayEdit.String = '10';
            obj.DelayEdit.HorizontalAlignment = 'left';
            obj.DelayEdit.Position = [.4 .7 .2 .05]; %[left bottom width height]
            
            obj.WriteDelayButton = uicontrol(obj.Figure, 'CallBack', @obj.writeDelay);
            obj.WriteDelayButton.Style = 'pushbutton';
            obj.WriteDelayButton.Units = 'normalized';
            obj.WriteDelayButton.FontSize = 12;
            obj.WriteDelayButton.String = '<html><center>Write Delay';
            obj.WriteDelayButton.HorizontalAlignment = 'center';
            obj.WriteDelayButton.Position = [.5 .4 .2 .2]; %[left bottom width height]
            
            obj.ForceInitButton = uicontrol(obj.Figure, 'CallBack', @obj.forceModuleInit);
            obj.ForceInitButton.Style = 'pushbutton';
            obj.ForceInitButton.Units = 'normalized';
            obj.ForceInitButton.FontSize = 12;
            obj.ForceInitButton.String = '<html><center>Find&Init<br>Signadyne Module';
            obj.ForceInitButton.HorizontalAlignment = 'center';
            obj.ForceInitButton.Position = [.3 .4 .2 .2]; %[left bottom width height]

            obj.Panel = uipanel('Parent',obj.Figure,'FontSize',14,...
              'Position',[0.005 .005 0.995 .1]);
            
            font_size_text_panel = 9;
            %--------------------------------------------------------------
            obj.ProductNameField = uicontrol('Parent',obj.Panel);
            obj.ProductNameField.Units = 'normalized';
            obj.ProductNameField.FontSize = font_size_text_panel;
            obj.ProductNameField.Position = [0 0.5 0.25 0.5]; %[left bottom width height]
            obj.ProductNameField.Style = 'text';
            obj.ProductNameField.String = 'Product Name:';
          
            obj.ProductNameString = uicontrol('Parent',obj.Panel);
            obj.ProductNameString.Units = 'normalized';
            obj.ProductNameString.FontSize = font_size_text_panel;
            obj.ProductNameString.Position = [0.25 0.5 0.25 0.5]; %[left bottom width height]
            obj.ProductNameString.Style = 'text';
            obj.ProductNameString.String = '?';
            %--------------------------------------------------------------
            obj.ModuleCountField = uicontrol('Parent',obj.Panel);
            obj.ModuleCountField.Units = 'normalized';
            obj.ModuleCountField.FontSize = font_size_text_panel;
            obj.ModuleCountField.Position = [0.5 0.5 0.25 0.5]; %[left bottom width height]
            obj.ModuleCountField.Style = 'text';
            obj.ModuleCountField.String = 'ModuleCount:';
            
            obj.ModuleCountString = uicontrol('Parent',obj.Panel);
            obj.ModuleCountString.Units = 'normalized';
            obj.ModuleCountString.FontSize = font_size_text_panel;
            obj.ModuleCountString.Position = [0.75 0.5 0.25 0.5]; %[left bottom width height]
            obj.ModuleCountString.Style = 'text';
            obj.ModuleCountString.String = '?';
            %--------------------------------------------------------------
            obj.SlotField = uicontrol('Parent',obj.Panel);
            obj.SlotField.Units = 'normalized';
            obj.SlotField.FontSize = font_size_text_panel;
            obj.SlotField.Position = [0.5 0 0.25 0.5]; %[left bottom width height]
            obj.SlotField.Style = 'text';
            obj.SlotField.String = 'Slot #:';
            
            obj.SlotString = uicontrol('Parent',obj.Panel);
            obj.SlotString.Units = 'normalized';
            obj.SlotString.FontSize = font_size_text_panel;
            obj.SlotString.Position = [0.75 0 0.25 0.5]; %[left bottom width height]
            obj.SlotString.Style = 'text';
            obj.SlotString.String = '?';
            %--------------------------------------------------------------
            obj.ChassisField = uicontrol('Parent',obj.Panel);
            obj.ChassisField.Units = 'normalized';
            obj.ChassisField.FontSize = font_size_text_panel;
            obj.ChassisField.Position = [0 0 0.25 0.5]; %[left bottom width height]
            obj.ChassisField.Style = 'text';
            obj.ChassisField.String = 'Chassis #:';
            
            obj.ChassisString = uicontrol('Parent',obj.Panel);
            obj.ChassisString.Units = 'normalized';
            obj.ChassisString.FontSize = font_size_text_panel;
            obj.ChassisString.Position = [0.25 0 0.25 0.5]; %[left bottom width height]
            obj.ChassisString.Style = 'text';
            obj.ChassisString.String = '?';
end

