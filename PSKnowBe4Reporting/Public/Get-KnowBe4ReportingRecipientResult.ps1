<#

.SYNOPSIS
    Gets a recipient result or a list of recipient results using the KnowBe4 Reporting API.
.DESCRIPTION
    This function gets all recipient results from a phishing security test or a specific recipient results of a phishing security test using the KnowBe4 Reporting API.
.INPUTS
    None
.OUTPUTS
    KnowBe4ReportingRecipientResult
.EXAMPLE
    PS C:\> Get-KnowBe4ReportingRecipientResult -PhishingSecurityTestId 123456

    RecipientResultId     : 426
    PishingSecurityTestId : 123456
    User                  : 72985
    ScheduledAt           : 10/22/2020 5:43:58 PM
    DeliveredAt           : 10/22/2020 5:44:10 PM
    OpenedAt              : 10/22/2020 5:44:28 PM
.PARAMETER PhishingSecurityTestId
    System.Int.  The KnowBe4 unique phishing security test id.
.PARAMETER RecipientId
    System.Int.  The KnowBe4 unique recipient id of a user that was in the targeted phishing security test.
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

Function Get-KnowBe4ReportingRecipientResult {

    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType()]

    param (
        [Parameter(Mandatory = $true, ValueFromPipeLine = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('PSTId')]
        [Int[]]
        $PhishingSecurityTestId,

        [Parameter(ParameterSetName = 'ByRecipientId', ValueFromPipelineByPropertyName = $true)]
        [Int[]]
        $RecipientId,

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
            'ByRecipientId' {
                foreach ($phishingSecurityTestIdValue in $PhishingSecurityTestId) {
                    foreach ($recipientIdValue in $RecipientId) {
                        [Array]$endpoint += 'phishing/security_tests/{0}/recipients/{1}?per_page=500' -f $phishingSecurityTestIdValue, $recipientIdValue
                    }
                }
            }

            default {
                foreach ($phishingSecurityTestIdValue in $PhishingSecurityTestId) {
                    [Array]$endpoint += 'phishing/security_tests/{0}/recipients?per_page=500' -f $phishingSecurityTestIdValue
                }
            }
        }

        Write-KnowBe4ReportingResponse -Endpoint $endpoint -ObjectType 'KnowBe4ReportingRecipientResult' -RawResponse $RawResponse.IsPresent -APIKey $APIKey
    }
}
