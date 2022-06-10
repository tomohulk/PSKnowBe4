<#

.SYNOPSIS
    Gets a group or a list of groups using the KnowBe4 Reporting API.
.DESCRIPTION
    This function gets all groups or a filtered list of groups using the KnowBe4 Reporting API.
    Users can be filtered by GroupId or Status.
.INPUTS
    None
.OUTPUTS
    KnowBe4ReportingGroup
.EXAMPLE
    PS C:\> Get-KnowBe4ReportingGroup -GroupId 123456

    GroupId          : 123456
    Name             : My_Group
    GroupType        : console_group
    MemberCount      : 1
    CurrentRiskScore : 44
    Status           : Active
.PARAMETER GroupId
    System.Int.  The KnowBe4 unique group_id.
.PARAMETER Status
    KnowBe4ReportingStatus.  The KnowBe4 enum status of a user.  Values are 'Active' or 'Archived'.
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


Function Get-KnowBe4ReportingGroup {

    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType()]

    param (
        [Parameter(ParameterSetName = 'ByGroupId')]
        [Int]
        $GroupId,

        [Parameter(ParameterSetName = "ByStatus")]
        [KnowBe4ReportingStatus]
        $Status,

        [Parameter()]
        [String]
        $APIKey = $env:KnowBe4ReportingAPIKey
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ByGroupId' {
            $endpoint = 'groups/{0}' -f $GroupId
        }

        'ByStatus' {
            $endpoint = 'groups?status={0}' -f $Status
        }

        default {
            $endpoint = 'groups'
        }
    }

    $apiCall = Invoke-KnowBe4ReportingAPI -Endpoint $endpoint -APIKey $APIKey
    foreach ($result in $apiCall) {
        [KnowBe4ReportingGroup]::new($result)
    }
}
