classdef gui < handle
    properties
        Figure                  % Graphics handles
        Axis
        Line
        TickerText
        TickerEdit
        PushButton
        Frame
        Panel
    end

    methods
        function app = gui
            % Main figure
            app.Figure = figure();
            app.Figure.DockControls   = 'off';
            app.Figure.MenuBar        = 'none';
            app.Figure.NumberTitle    = 'off';
            app.Figure.Name           = 'Phase-shifter controller';
            app.Figure.ToolBar        = 'auto';
            app.Figure.Visible        = 'on';
            app.Figure.Renderer       = 'opengl'; %or 'painters'
            app.Figure.RendererMode      = 'auto'; %or 'manual'
            app.Figure.GraphicsSmoothing = 'on';
            
            app.Figure.CloseRequestFcn   = @app.closeApp;
            
%             app.Axis = axes('Parent',app.Figure);           % Axis for prices
%             app.Axis.Position = [.13 .15 .78 .75];
%             
%             app.TickerText = uicontrol(app.Figure,...          % 'Symbol' label
%                 'Style','text','Position',[20 20 50 20],...
%                 'String','Symbol:');
% 
%             ylabel(app.Axis,'Stock value ($)') ;
%             set(app.Axis,'XTickLabel','') ;
            
            app.PushButton = uicontrol(app.Figure);
            app.PushButton.Style = 'pushbutton';
            app.PushButton.Position = [.0 .1 .1 .2];
            
%             app.Frame = uicontrol(app.Figure);
%             app.Frame.Style = 'frame';
%             app.Frame.Position = [ 0 0 0 0.4 ];
            
            app.Panel = uipanel('Parent',app.Figure,'FontSize',12,...
              'Position',[.4 .1 .5 .1]);

        end

        function closeApp(app,hObject,eventdata)
        % This function runs when the app is closed
            delete(app.Figure);
        end



    end
end                                                      % End of class definition