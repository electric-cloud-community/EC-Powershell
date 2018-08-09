
use strict;
use warnings;
use ElectricCommander;
$|=1;

# -------------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------------
my $ec = ElectricCommander->new();
$ec->abortOnError(0);
my $powershellCommand = ($ec->getProperty( "powershellCommand" ))->findvalue('//value')->string_value;
my $powershellFile    = ($ec->getProperty( "powershellFile" ))->findvalue('//value')->string_value;

########################################################################
# main - contains the whole process to be done by the plugin, it builds 
#        the command line, sets the properties and the working directory
#
# Arguments:
#   -none

#
# Returns:
#   -nothing
#
########################################################################

sub main {
    
    # create args array
    my @args = ();
    my %props;	

    my $cmd = createpowershellCommandLine(\@args);
    $ec->setProperty("/myCall/powershellCommandLine", $cmd);
}

########################################################################
# createpowershellCommandLine - creates the command line for the invocation
# of the program to be executed.
#
# Arguments:
#   -arr: array containing the command name and the arguments entered by 
#         the user in the UI
#
# Returns:
#   -the command line to be executed by the plugin
#
########################################################################

sub createpowershellCommandLine{

    my $commandLine="";
    my $code=""; 
    
    if($powershellFile && $powershellFile ne ""){
        $commandLine = qq{powershell.exe -File "$powershellFile"};
    }else{
        if($powershellCommand  && $powershellCommand  ne "") {
            $code = "$powershellCommand";
        }
        
        my $tmp_file = "temp$[jobStepId].ps1";
        #Creates a temporary file and write powershell script on it and then executes the temp file.
        open (MYFILE, ">$tmp_file");
        print MYFILE "$code";
        close (MYFILE);
        
        $commandLine = "powershell.exe -File $tmp_file";
    }
    
    return  $commandLine;    
}

main();
