#region ProviderPath

$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path
foreach ($path in @('Private', 'Public')) {
    (Resolve-Path -Path "${moduleRoot}\${path}\*.ps1").Foreach({ . $_.ProviderPath })
}

#endregion ProviderPath


#region Aliases

New-Alias -Name Get-KB4RGroup            -Value Get-KnowBe4ReportingGroup
New-Alias -Name Get-KB4RPhishingCampaign -Value Get-KnowBe4ReportingPhishingCampaign
New-Alias -Name Get-KB4RPST              -Value Get-KnowBe4ReportingPhishingSecurityTest
New-Alias -Name Get-KB4RRecipientResult  -Value Get-KnowBe4ReportingRecipientResult
New-Alias -Name Get-KB4RSubscription     -Value Get-KnowBe4ReportingSubscription
New-Alias -Name Get-KB4RUser             -Value Get-KnowBe4ReportingUser

#endregion Aliases
