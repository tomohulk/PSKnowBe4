<#

.SYNOPSIS
    Gets a user or a list of users using the KnowBe4 Reporting API.
.DESCRIPTION
    This function gets all users or a filtered list of users using the KnowBe4 Reporting API.
    Users can be filtered by Id, Status, or GroupId.
    The Group information can also be expanded for each user returned, note this will greatly increase the return time for the call.
.INPUTS
    None
.OUTPUTS
    KnowBe4ReportingUser
.EXAMPLE
    PS C:\> Get-KnowBe4ReportingUser -UserId 123456

    UserId               : 123456
    FirstName            : Thomas
    LastName             : Malkewitz
    Status               : Active
    Email                : thomas.malkewitz@github.com
    PhishPronePercentage : 33.3
    CurrentRiskScore     : 40.0
.PARAMETER Id
    System.Int.  The KnowBe4 unique user id.
.PARAMETER Status
    KnowBe4ReportingStatus.  The KnowBe4 enum status of a user.  Values are 'Active' or 'Archived'.
.PARAMETER GroupId
    System.Int.  The KnowBe4 unique group id.
.PARAMETER ExpandGroup
    System.Management.Automation.SwitchParameter.  If this parameter is used, all of the groups a user of will be expanded.  By default only the GroupId is populated.
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


Function Get-KnowBe4ReportingUser {

    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType()]

    Param (
        [Parameter(ParameterSetName = 'ByUserId', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Int[]]
        $UserId,

        [Parameter(ParameterSetName = 'ByUserStatus')]
        [KnowBe4ReportingStatus]
        $Status,

        [Parameter(ParameterSetName = 'ByGroupId', ValueFromPipelineByPropertyName = $true)]
        [Int[]]
        $GroupId,

        [Parameter()]
        [Switch]
        $ExpandGroup,

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
            'ByUserId' {
                foreach ($userIdValue in $UserId) {
                    [Array]$endpoint += 'users/{0}?per_page=500' -f $userIdValue
                }
            }

            'ByUserStatus' {
                $endpoint = 'users?status={0}&per_page=500' -f $Status
            }

            'ByGroupId' {
                foreach ($GroupIdValue in $GroupId) {
                    [Array]$endpoint += 'groups/{0}/members&per_page=500' -f $groupIdValue
                }
            }

            default {
                $endpoint = 'users?per_page=500'
            }
        }

        if ($ExpandGroup.IsPresent) {
            $endpoint += '&expand=groups'
        }

        Write-KnowBe4ReportingResponse -Endpoint $endpoint -ObjectType 'KnowBe4ReportingUser' -RawResponse $RawResponse.IsPresent -APIKey $APIKey
    }
}
