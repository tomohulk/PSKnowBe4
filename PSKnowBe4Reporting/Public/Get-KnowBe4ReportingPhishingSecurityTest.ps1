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
    PS C:\> Get-KnowBe4ReportingPhishingSecurityTest -Id 123456

    Id               : 123456
    Name             : PasswordTest-AllUsers
    Group            : {All_Users}
    Status           : Closed
    DeliveredCount   : 1000
    OpenedCount      : 774
    ClickedCount     : 120
    DataEnteredCount : 74
.PARAMETER Id
    System.Int.  The KnowBe4 unique phishing security test id.
.PARAMETER CampaignId
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


Function Get-KnowBe4ReportingPhishingSecurityTest {

    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType()]

    param (
        [Parameter(ParameterSetName = 'ById')]
        [Int]
        $Id,

        [Parameter(ParameterSetName = 'ByCampaignId')]
        [Int]
        $CampaignId,

        [Parameter()]
        [String]
        $APIKey = $env:KnowBe4ReportingAPIKey
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $endpoint = 'phishing/security_tests/{0}?per_page=500' -f $Id
        }

        'ByCampaignId' {
            $endpoint = 'phishing/campaigns/{0}/security_tests?per_page=500' -f $CampaignId
        }

        default {
            $endpoint = 'phishing/security_tests?per_page=500'
        }
    }
    
    $page = 1
    do {
        $endpoint += '&page={0}' -f $page
        $apiCall = Invoke-KnowBe4ReportingAPI -Endpoint $endpoint -APIKey $APIKey
        foreach ($result in $apiCall) {
            [KnowBe4ReportingPhishingSecurityTest]::new($result)
        }
        $page++
    } until ($apiCall.Count -lt 500)
}
