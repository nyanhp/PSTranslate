function New-AzureTranslation
{
    [CmdletBinding()]
    param
    (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true)]
        [string]
        $Value,

        [Parameter(Mandatory = $true)]
        [CultureInfo]
        $From,

        [Parameter(Mandatory = $true)]
        [CultureInfo]
        $To,

        [Parameter()]
        [String]
        $ApiVersion = '3.0'
    )

    begin
    {

        $azureUri = 'https://api.cognitive.microsofttranslator.com/translate?api-version={0}&from={1}&to={2}' -f $ApiVersion, $From.TwoLetterISOLanguageName, $To.TwoLetterISOLanguageName
        $key = Get-TranslationApiKey -Provider Azure

        if (-not $key)
        {
            Write-Error -Message 'No valid API key found. Try adding one with Add-TranslationApiKey -Provider Azure. See https://docs.microsoft.com/en-us/azure/cognitive-services/translator/translator-info-overview for more information.' -RecommendedAction 'Add API key'
            return
        }

        $header = @{
            'Ocp-Apim-Subscription-Key' = $key
        }

        Write-Verbose -Message $('Using endpoint {0} with API key {1}' -f $azureUri, $($( -join $key[0, 1]) + $('*' * 28) + $( -join $key[-2, -1])))

        $requestCollector = New-Object -TypeName System.Collections.Specialized.OrderedDictionary
        $count = 0
        $requestCollector.Add($count, @())
    }

    process
    {
        if ($requestCollector[$count].Count -gt 23)
        {
            $count ++
            $requestCollector.Add($count, @())
        }

        Write-Verbose -Message "Adding '$Value' to collection ($($requestCollector[$count].Count) elements)"
        $requestCollector[$count] += @{ Text = $Value }
    }

    end
    {
        Write-Verbose -Message "Requesting $($requestCollector.Count) batch(es) of translations"
        foreach ($entry in $requestCollector.GetEnumerator())
        {
            $jsonBody = ConvertTo-Json -InputObject $entry.Value
            Write-Verbose -Message "Using body `n`n$jsonBody"
            $(Invoke-RestMethod -Method Post -Uri $azureUri -Body $jsonBody -Headers $header -ContentType application/json).translations.text
        }
    }

}
