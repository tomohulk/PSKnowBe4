#region ProviderPath

$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path
foreach ($path in @('Private', 'Public')) {
    (Resolve-Path -Path "${moduleRoot}\${path}\*.ps1").Foreach({ . $_.ProviderPath })
}

#endregion ProviderPath
