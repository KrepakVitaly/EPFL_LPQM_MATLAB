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
            
            % Create module object
            
            if obj.Aou.isOpen() % By default module should not be opened.
                disp('Module is alredy opened. Demo will close it.');
                obj.Aou.close();
            end;
            % Open module
            if obj.Aou.open(product_name, chassis, slot) < 0
                disp(['Error opening module ', product_name, ', make sure the slot and chassis are correct.']);
                disp('Aborting demo...');
                return;
            end
end

