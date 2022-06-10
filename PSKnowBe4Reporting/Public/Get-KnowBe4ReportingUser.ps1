Function Get-KnowBe4ReportingUser {

    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType()]

    Param (
        [Parameter(ParameterSetName = 'ByUserId')]
        [Int]
        $UserId,

        [Parameter(ParameterSetName = 'ByUserStatus')]
        [KnowBe4ReportingStatus]
        $Status,

        [Parameter()]
        [Switch]
        $ExpandGroup
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ByUserId' {
            $endpoint = 'users/{0}?per_page=500' -f $UserId
        }

        'ByUserStatus' {
            $endpoint = 'users?status={0}&per_page=500' -f $Status
        }

        default {
            $endpoint = 'users?per_page=500'
        }
    }

    if ($ExpandGroup.IsPresent) {
        $endpoint += '&expand=groups'
    }

    $page = 1
    do {
        $endpoint += '&page={0}' -f $page
        $apiCall = Invoke-KnowBe4ReportingAPI -Endpoint $endpoint
        foreach ($result in $apiCall) {
            [KnowBe4ReportingUser]::new($result)
        }
        $page++
    } until ($apiCall.Count -lt 500)
}
