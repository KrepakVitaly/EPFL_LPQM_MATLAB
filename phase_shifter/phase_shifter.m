clear all;
clear classes;


% Load Visual Studio Library
tes = NET.addAssembly('C:/Program Files (x86)/Signadyne/Libraries/VisualStudio_AnyCPU/Reference Assemblies/VS2008/Signadyne.dll');
% disp(tes.Classes);

slot = 2;
part = 'SD-PXE-AIO-H3336F-2G';

% Create module object
aou = Signadyne.SD_AOU(); 

if aou.isOpen() % By default module should not be opened.
    disp('Module is alredy opened. Demo will close it.');
    aou.close();
end;


% Open module
if aou.open(part, 1, slot) < 0
    disp(['Error opening module ', part, ', make sure the slot and chassis are correct.']);
    disp('Aborting demo...');
    return;
end;

app = gui();