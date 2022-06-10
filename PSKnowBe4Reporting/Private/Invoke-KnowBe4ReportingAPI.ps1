Function Invoke-KnowBe4ReportingAPI {
    Param (
        [Parameter(Mandatory = $true)]
        [String]
        $Endpoint,

        [Parameter(Mandatory = $true)]
        [String]
        $APIKey
    )

    Process {
        if ($null -eq $APIKey) {
            $PSCmdlet.ThrowTerminatingError('Please Provide a valid API Key, or set the KnowBe4ReportingAPIKey environment variable.')
            break
        }

        $restMethod = @{
            Uri = 'https://us.api.knowbe4.com/v1/{0}' -f $Endpoint
            Method = 'Get'
            ErrorAction = 'Stop'
            Headers = @{
                Authorization = 'Bearer {0}' -f $APIKey
                Accept = 'application/json'
            }
        }

        try {
            Invoke-RestMethod @restMethod
        } catch {
            $PSCmdlet.ThrowTerminatingError($_)
            break
        }
    }
}
