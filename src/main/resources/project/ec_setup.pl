my %runPowerShell = (
    label       => "PowerShell - Run PowerShell",
    procedure   => "runPowerShell",
    description => "Creates a powershell step",
    category    => "Scripting/Shell"
);

my %runPowerShellBroadcast = (
    label       => "PowerShell - Run broadcast PowerShell",
    procedure   => "runPowerShellBroadcast",
    description => "Creates a powershell step with enabled broadcasting",
    category    => "Scripting/Shell"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Powershell - runPowerShell");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/PowerShell - Run PowerShell");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/PowerShell - Run broadcast PowerShell");

@::createStepPickerSteps = (
    \%runPowerShell,
    \%runPowerShellBroadcast
);
