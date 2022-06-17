<#

.SYNOPSIS
    Gets a phishing security test or a list of phishing security tests using the KnowBe4 Reporting API.
.DESCRIPTION
    This function gets all phishing security test or a filtered list of phishing security tests using the KnowBe4 Reporting API.
    Users can be filtered by Id, or CampaignId
.INPUTS
    None
.OUTPUTS
    KnowBe4ReportingPhishingSecurityTest
.EXAMPLE
    PS C:\> Get-KnowBe4ReportingPhishingSecurityTest -PhishingSecurityId 123456

    PhishingSecurityTestId : 123456
    Name                   : PasswordTest-AllUsers
    Group                  : 654321
    Status                 : Closed
    DeliveredCount         : 1000
    OpenedCount            : 774
    ClickedCount           : 120
    DataEnteredCount       : 74
.PARAMETER PhishingSecurityTestId
    System.Int.  The KnowBe4 unique phishing security test id.
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


Function Get-KnowBe4ReportingPhishingSecurityTest {

    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType()]

    param (
        [Parameter(ParameterSetName = 'ByPhishingSecurityTestId', ValueFromPipeLine = $true, ValueFromPipelineByPropertyName = $true)]
        [Int[]]
        $PhishingSecurityTestId,

        [Parameter(ParameterSetName = 'ByPhishingCampaignId', ValueFromPipelineByPropertyName = $true)]
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
            'ByPhishingSecurityTestId' {
                foreach ($phishingSecurityTestIdValue in $PhishingSecurityTestId) {
                    [Array]$endpoint += 'phishing/security_tests/{0}?per_page=500' -f $phishingSecurityTestIdValue
                }
            }

            'ByPhishingCampaignId' {
                foreach ($phishingCampaignIdValue in $PhishingCampaignId) {
                    [Array]$endpoint += 'phishing/campaigns/{0}/security_tests?per_page=500' -f $phishingCampaignIdValue
                }
            }

            default {
                $endpoint = 'phishing/security_tests?per_page=500'
            }
        }

        Write-KnowBe4ReportingResponse -Endpoint $endpoint -ObjectType 'KnowBe4ReportingPhishingSecurityTest' -RawResponse $RawResponse.IsPresent -APIKey $APIKey
    }
}
