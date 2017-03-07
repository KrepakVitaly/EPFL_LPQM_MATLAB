function moduleInit(obj)
            module_count = Signadyne.SD_Module.moduleCount();
            obj.ModuleCountString.String = module_count;
            
            slot = 2;
            obj.SlotString.String = slot;
            
            chassis = Signadyne.SD_Module.getChassis(0);
            obj.ChassisString.String = chassis;
            
            product_name = char(Signadyne.SD_Module.getProductName(chassis, slot));
            obj.ProductNameString.String = product_name;
            
            serial_number = char(Signadyne.SD_Module.getSerialNumber(chassis, slot));
            
            
            if obj.Aio.isOpen() % By default module should not be opened.
                disp('AIOmodule is alredy opened. I will close it.');
                obj.Aio.close();
            end
            % Open module
            SDmoduleID = obj.Aio.open(product_name, chassis, slot)
            if SDmoduleID < 0
                disp(['Error opening AIOmodule ', product_name, ', make sure the slot and chassis are correct.']);
                disp('Aborting demo...');
                return;
            end
            %(int nDAQ, int nDAQpointsPerCycle, int nCycles, int triggerDelay, int triggerMode)
            obj.Aio.DAQconfig(0, 500, 1, 0, 0);
            obj.Aio.DAQconfig(1, 500, 1, 0, 0);
            obj.Aio.DAQstart(0);
            obj.Aio.DAQstart(1);
end

