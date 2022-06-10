<#

.SYNOPSIS
    Gets subscription and account information using the KnowBe4 Reporting API.
.DESCRIPTION
    Gets the subscription information about an account including administrators and subscription levels.
.INPUTS
    None
.OUTPUTS
    KnowBe4ReportingSubscription
.EXAMPLE
    PS C:\> Get-KnowBe4ReportingSubscription

    Name                : tomohulk phishing
    Type                : paid
    Domain              : {tomohulk.github.io}
    Administrators      : {123456, 654321}
    SubscriptionLevel   : Phishing Premium 
    SubscriptionEndDate : 01/01/2025 12:00:00 AM
    NumberOfSeats       : 426
    CurrentRiskScore    : 29.426
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


Function Get-KnowBe4ReportingSubscription {

    [CmdletBinding()]
    [OutputType()]

    Param(
        [Parameter()]
        [String]
        $APIKey = $env:KnowBe4ReportingAPIKey
    )

    $endpoint = "account"
    $apiCall = Invoke-KnowBe4ReportingAPI -Endpoint $endpoint -APIKey $APIKey
    foreach($result in $apiCall) {
        [KnowBe4ReportingSubscription]::new($result)
    }
}
