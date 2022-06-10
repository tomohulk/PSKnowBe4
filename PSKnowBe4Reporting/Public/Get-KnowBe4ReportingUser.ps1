Function Get-KnowBe4ReportingUser {
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
            $endpoint = 'users/{0}' -f $UserId
        }

        'ByUserStatus' {
            $endpoint = 'users?status={0}' -f $Status
        }

        default {
            $endpoint = 'users'
        }
    }

    if ($ExpandGroup.IsPresent) {
        $endpoint += '?expand=group'
    }

    foreach ($result in (Invoke-KnowBe4ReportingAPI -Endpoint $endpoint)) {
        [KnowBe4ReportingUser]::new($result)
    }
}
