function moduleInit(obj)
            module_count = Signadyne.SD_Module.moduleCount();
            obj.Parent.DigitalFeedbackUI_Instance.ModuleCountString.String = module_count;
            
            slot = Signadyne.SD_Module.getSlot(0);
            obj.Parent.DigitalFeedbackUI_Instance.SlotString.String = slot;
            
            chassis = Signadyne.SD_Module.getChassis(0);
            obj.Parent.DigitalFeedbackUI_Instance.ChassisString.String = chassis;
            
            product_name = char(Signadyne.SD_Module.getProductName(chassis, slot));
            obj.Parent.DigitalFeedbackUI_Instance.ProductNameString.String = product_name;
            
            serial_number = char(Signadyne.SD_Module.getSerialNumber(chassis, slot));
            obj.Parent.DigitalFeedbackUI_Instance.SerialNumString.String = serial_number;
            
            obj.Parent.DigitalFeedbackUI_Instance.update();
                       
            if obj.Aio.isOpen() % By default module should not be opened.
                disp('AIOmodule is alredy opened. I will close it.');
                obj.Aio.close();
            end
            % Open module
            obj.SDmoduleID = obj.Aio.open(product_name, chassis, slot);
            if obj.SDmoduleID < 0
                disp(['Error opening AIOmodule ', product_name, ', make sure the slot and chassis are correct.']);
                disp('Aborting...');
                return;
            else
                obj.IsModuleOpen = true;
            end
            
            %http://literature.cdn.keysight.com/litweb/pdf/M3100-90002.pdf?id=2796080
            
            obj.Aio.channelInputConfig(0,... %channel
                digital_feedback.Consts.DEFAULT_FULL_SCALE,...
                digital_feedback.Consts.DEFAULT_AIN_IMPEDANCE,...
                digital_feedback.Consts.DEFAULT_AIN_COUPLING);
            
            obj.Aio.DAQconfig(...
                0,...   %nDAQ
                500,... %nDAQpointsPerCycle
                1,...   %nCycles
                0,...   %triggerDelay
                0 );    %triggerMode
            
            obj.Aio.DAQstart(0);
%             obj.Aio.DAQstart(1);
end

