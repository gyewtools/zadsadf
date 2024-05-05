# PowerShell script to modify Defender settings

# Function to run PowerShell commands
function Run-PS {
    param(
        [string]$Command
    )
    Invoke-Expression $Command
}

# Function to check and modify Defender settings
function Check-Defender {
    $output = Get-MpPreference -verbose
    $lines = $output -split '\n'

    foreach ($line in $lines) {
        if ($line.StartsWith("DisableRealtimeMonitoring") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisableRealtimeMonitoring \$true"
        }
        if ($line.StartsWith("DisableBehaviorMonitoring") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisableBehaviorMonitoring \$true"
        }
        if ($line.StartsWith("DisableBlockAtFirstSeen") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisableBlockAtFirstSeen \$true"
        }
        if ($line.StartsWith("DisableIOAVProtection") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisableIOAVProtection \$true"
        }
        if ($line.StartsWith("DisablePrivacyMode") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisablePrivacyMode \$true"
        }
        if ($line.StartsWith("SignatureDisableUpdateOnStartupWithoutEngine") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine \$true"
        }
        if ($line.StartsWith("DisableArchiveScanning") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisableArchiveScanning \$true"
        }
        if ($line.StartsWith("DisableIntrusionPreventionSystem") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisableIntrusionPreventionSystem \$true"
        }
        if ($line.StartsWith("DisableScriptScanning") -and $line.EndsWith("False")) {
            Run-PS "Set-MpPreference -DisableScriptScanning \$true"
        }
        if ($line.StartsWith("SubmitSamplesConsent") -and !($line.EndsWith("2"))) {
            Run-PS "Set-MpPreference -SubmitSamplesConsent 2"
        }
        if ($line.StartsWith("MAPSReporting") -and !($line.EndsWith("0"))) {
            Run-PS "Set-MpPreference -MAPSReporting 0"
        }
        if ($line.StartsWith("HighThreatDefaultAction") -and !($line.EndsWith("6"))) {
            Run-PS "Set-MpPreference -HighThreatDefaultAction 6 -Force"
        }
        if ($line.StartsWith("ModerateThreatDefaultAction") -and !($line.EndsWith("6"))) {
            Run-PS "Set-MpPreference -ModerateThreatDefaultAction 6"
        }
        if ($line.StartsWith("LowThreatDefaultAction") -and !($line.EndsWith("6"))) {
            Run-PS "Set-MpPreference -LowThreatDefaultAction 6"
        }
        if ($line.StartsWith("SevereThreatDefaultAction") -and !($line.EndsWith("6"))) {
            Run-PS "Set-MpPreference -SevereThreatDefaultAction 6"
        }
    }
}

# Main function
function Main {
    Check-Defender
}

Main
