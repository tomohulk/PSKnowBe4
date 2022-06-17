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
    PS C:\> Get-KnowBe4ReportingPhishingCampaign -PhishingCampaignId 123456

    PhishingCampaignId       : 123456
    Name                     : TestCampaignAllUsers
    Group                    : {All_Users}
    LastPhishPronePercentage : 0.426
    LastRun                  : 1/1/2022 5:54:18 PM
    Status                   : Closed
.PARAMETER PhishingCampaignId
    System.Int.  The KnowBe4 unique campaign id.
.PARAMETER RawResponse
    System.Management.Automation.Switch.  Returns the raw JSON response.
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
        [Parameter(ParameterSetName = 'ByPhishingCampaignId', ValueFromPipeLine = $true, ValueFromPipelineByPropertyName = $true)]
        [Int[]]
        $PhishingCampaignId,

        [Parameter()]
        [Switch]
        $RawResponse,

        [Parameter()]
        [String]
        $APIKey = $env:KnowBe4ReportingAPIKey
    )

    process {
        $endpoint = $null
        switch ($PSCmdlet.ParameterSetName) {
            'ByPhishingCampaignId' {
                foreach ($phishingCampaignIdValue in $PhishingCampaignId) {
                    [Array]$endpoint += 'phishing/campaigns/{0}?per_page=500' -f $phishingCampaignIdValue
                }
            }

            default {
                $endpoint = 'phishing/campaigns?per_page=500'
            }
        }

        Write-KnowBe4ReportingResponse -Endpoint $endpoint -ObjectType 'KnowBe4ReportingPhishingCampaign' -RawResponse $RawResponse.IsPresent -APIKey $APIKey
    }
}
