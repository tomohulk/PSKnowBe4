@{

# Script module or binary module file associated with this manifest.
RootModule = 'PSKnowBe4Reporting.psm1'

# Version number of this module.
ModuleVersion = '1.0.0.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '290f93b9-eaec-4e5c-8799-02e9b83b902f'

# Author of this module
Author = 'Thomas Malkewitz @tomohulk'

# Company or vendor of this module
# CompanyName = ''

# Copyright statement for this module
Copyright = '(c) thomas. All rights reserved.'

# Description of the functionality provided by this module
# Description = ''

# Minimum version of the PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'PSKnowBe4Reporting.Formats.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    'Get-KnowBe4ReportingGroup'
    'Get-KnowBe4ReportingPhishingCampaign'
    'Get-KnowBe4ReportingPhishingSecurityTest'
    'Get-KnowBe4ReportingRecipientResult'
    'Get-KnowBe4ReportingSubscription'
    'Get-KnowBe4ReportingUser'
)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
# CmdletsToExport = '*'

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @(
    'Get-KB4RGroup'
    'Get-KB4RPhishingCampaign'
    'Get-KB4RPST'
    'Get-KB4RRecipientResult'
    'Get-KB4RSubscription'
    'Get-KB4RUser'
)

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @(
    'Private\Invoke-KnowBe4ReportingAPI.ps1'
    'Private\KnowBe4Reporting.ObjectDefinitions.ps1'
    'Private\Write-KnowBe4ReportingResponse.ps1'
    'Public\Get-KnowBe4ReportingGroup.ps1'
    'Public\Get-KnowBe4ReportingPhishingCampaign.ps1'
    'Public\Get-KnowBe4ReportingPhishingSecurityTest.ps1'
    'Public\Get-KnowBe4ReportingRecipientResult.ps1'
    'Public\Get-KnowBe4ReportingSubscription.ps1'
    'Public\Get-KnowBe4ReportingUser.ps1'
    'PSKnowBe4Reporting.Formats.ps1xml'
    'PSKnowBe4Reporting.psd1'
    'PSKNowBe4Reporting.psm1'
)

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

