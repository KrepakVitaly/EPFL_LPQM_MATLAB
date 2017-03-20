function moduleInit(obj)
            module_count = Signadyne.SD_Module.moduleCount();
            obj.ModuleCountString.String = module_count;
            
            slot = Signadyne.SD_Module.getSlot(0);
            obj.SlotString.String = slot;
            
            chassis = Signadyne.SD_Module.getChassis(0);
            obj.ChassisString.String = chassis;
            
            product_name = char(Signadyne.SD_Module.getProductName(chassis, slot));
            obj.ProductNameString.String = product_name;
            
            serial_number = char(Signadyne.SD_Module.getSerialNumber(chassis, slot));
            obj.SerialNumString.String = serial_number;
                       
            if obj.Aio.isOpen() % By default module should not be opened.
                disp('AIOmodule is alredy opened. I will close it.');
                obj.Aio.close();
            end
            % Open module
            SDmoduleID = obj.Aio.open(product_name, chassis, slot);
            if SDmoduleID < 0
                disp(['Error opening AIOmodule ', product_name, ', make sure the slot and chassis are correct.']);
                disp('Aborting...');
                return;
            else
                ModuleIsOpened = true;
            end
            
            %http://literature.cdn.keysight.com/litweb/pdf/M3100-90002.pdf?id=2796080
            AIN_IMPEDANCE_50=0;
            AIN_IMPEDANCE_HIZ=1;
            AIN_COUPLING_DC=0;
            AIN_COUPLING_AC=1;
            
            %obj.Aio.channelInputConfig(0, double fullScale, int impedance, int coupling)
            obj.Aio.channelInputConfig(0, 3.0, AIN_IMPEDANCE_50, AIN_COUPLING_DC);
            obj.Aio.DAQconfig(0, 500, 1, 0, 0);
            obj.Aio.DAQconfig(1, 500, 1, 0, 0);
            obj.Aio.DAQstart(0);
%             obj.Aio.DAQstart(1);
end

