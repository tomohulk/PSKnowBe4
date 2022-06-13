<#
.SYNOPSIS
    Gets a campaign or a list of campaigns using the KnowBe4 Reporting API.
.DESCRIPTION
    This function gets all campaigns or a specific campaign using the KnowBe4 Reporting API.
.INPUTS
    None
.OUTPUTS
    KnowBe4ReportingPhishingCampaign
.EXAMPLE
    PS C:\> Get-KnowBe4ReportingPhishingCampaign -Id 123456

    Id                       : 123456
    Name                     : TestCampaignAllUsers
    Group                    : {All_Users}
    LastPhishPronePercentage : 0.426
    LastRun                  : 1/1/2022 5:54:18 PM
    Status                   : Closed
.PARAMETER Id
    System.Int.  The KnowBe4 unique campaign id.
.PARAMETER APIKey
    System.String.  A valid KnowBe4 API Token.
.NOTES
    A valid KnowBe4 API Key is needed.
    This can be passed per command or can be set in the '$env:KnowBe4ReportingAPIKey' environment variable.
.LINK
    https://github.com/tomohulk/PSKnowBe4
.LINK
    https://tomohulk.github.io
#>

Function Get-KnowBe4ReportingPhishingCampaign {

    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType()]

    param (
        [Parameter(ParameterSetName = 'ById')]
        [Object]
        $Id,

        [Parameter()]
        [String]
        $APIKey = $env:KnowBe4ReportingAPIKey
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $endpoint = 'phishing/campaigns/{0}?per_page=500' -f $Id
        }
        default {
            $endpoint = 'phishing/campaigns?per_page=500'
        }
    }

    $page = 1
    do {
        $endpoint += '&page={0}' -f $page
        $apiCall = Invoke-KnowBe4ReportingAPI -Endpoint $endpoint -APIKey $APIKey
        foreach ($result in $apiCall) {
            [KnowBe4ReportingPhishingCampaign]::new($result)
        }
        $page++
    } until ($apiCall.Count -lt 500)
}
