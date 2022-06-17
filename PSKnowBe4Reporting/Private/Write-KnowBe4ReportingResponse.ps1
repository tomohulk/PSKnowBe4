Function Write-KnowBe4ReportingResponse {

    [CmdletBinding()]
    [OutputType()]

    param (
        [Parameter(Mandatory = $true)]
        [String[]]
        $Endpoint,

        [Parameter(Mandatory = $true)]
        [String]
        $ObjectType,

        [Parameter(Mandatory = $true)]
        [Bool]
        $RawResponse,

        [Parameter()]
        [String]
        $APIKey
    )

    foreach ($value in $Endpoint) {
        $page = 1
        do {
            $value += '&page={0}' -f $page
            $apiCall = Invoke-KnowBe4ReportingAPI -Endpoint $value -APIKey $APIKey
            foreach ($result in $apiCall) {
                if ($RawResponse) {
                    Write-Output -InputObject $result
                } else {
                    Write-Output -InputObject ($ObjectType -as [Type])::new($result)
                }
            }
            $page++
        } until ($apiCall.Count -lt 500)
    }
}
