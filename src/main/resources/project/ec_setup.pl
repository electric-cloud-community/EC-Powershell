my %runPowerShell = (
    label       => "PowerShell - Run PowerShell",
    procedure   => "runPowerShell",
    description => "Creates a powershell step",
    category    => "Scripting/Shell"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Powershell - runPowerShell");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/PowerShell - Run PowerShell");

@::createStepPickerSteps = (\%runPowerShell);
