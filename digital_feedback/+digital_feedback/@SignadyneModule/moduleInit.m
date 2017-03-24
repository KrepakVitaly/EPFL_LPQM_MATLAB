function err_code = moduleInit(obj)
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
                err_code = obj.SDmoduleID;
                return;
            else
                obj.IsModuleOpen = true;
                err_code = 0;
            end
            
            err_code = obj.Aio.channelInputConfig(0,... %channel
                        obj.FullScale,...
                        obj.Impedance,...
                        obj.Coupling);
            
            err_code = obj.Aio.DAQconfig(...
                0,...   %nDAQ
                500,... %nDAQpointsPerCycle
                1,...   %nCycles
                0,...   %triggerDelay
                0 );    %triggerMode
            
            err_code = obj.Aio.DAQstart(0);
%             obj.Aio.DAQstart(1);
end

