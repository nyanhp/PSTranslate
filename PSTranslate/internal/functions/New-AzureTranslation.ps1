function New-AzureTranslation
{
<#
	.SYNOPSIS
		Uses Azure Cognitive Services to translate text.

	.DESCRIPTION
		Uses Azure Cognitive Services to translate text.

	.PARAMETER Value
		The text to translate.

	.PARAMETER From
		The language to translate from.

	.PARAMETER To
		The language to translate to.

	.PARAMETER ApiVersion
		The API version to use.

	.EXAMPLE
		PS C:\> $text | New-AzureTranslation -From $From -To $To

		Converts the text stored in the $text from one language to another
#>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
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
        $providerOptions = Get-PSFConfigValue -FullName PSTranslate.Azure.Options
        $key = Get-TranslationApiKey -Provider Azure

        if (-not $key)
		{
			Stop-PSFFunction -String 'New-AzureTranslation.ApiKey.NotFound'
            return
        }

        $header = @{
            'Ocp-Apim-Subscription-Key' = $key
        }

        if ($providerOptions.ExtraHeader)
        {
            $header += $providerOptions.ExtraHeader
        }

		Write-PSFMessage -String 'New-AzureTranslation.Preparing' -StringValues $From.TwoLetterISOLanguageName, $To.TwoLetterISOLanguageName, $($(-join $key[0, 1]) + $('*' * 28) + $(-join $key[-2, -1])), $azureUri

        $requestCollector = New-Object -TypeName System.Collections.Specialized.OrderedDictionary
        $count = 0
        $requestCollector.Add($count, @())
        $currentLength = 0
        $charactersPerSecond = [Math]::Floor($providerOptions.CharacterLimit / $providerOptions.LimitWindow.TotalSeconds)
    }

    process
    {
        if ($requestCollector[$count].Count -gt 999 -or ($currentLength + $Value.Length) -ge $charactersPerSecond)
        {
            $count ++
            $requestCollector.Add($count, @())
            $currentLength = 0
        }

		Write-PSFMessage -String 'New-AzureTranslation.AddingInput' -StringValues $Value, $requestCollector[$count].Count
        $requestCollector[$count] += @{ Text = $Value }
        $currentLength += $Value.Length
    }

    end
	{
		Write-PSFMessage -String 'New-AzureTranslation.ExecutingBatches' -StringValues $requestCollector.Count, $charactersPerSecond
        foreach ($entry in $requestCollector.GetEnumerator())
        {
			$jsonBody = ConvertTo-Json -InputObject $entry.Value
            $(Invoke-RestMethod -Method Post -Uri $azureUri -Body $jsonBody -Headers $header -ContentType application/json).translations.text
            [Threading.Thread]::Sleep(1000) # Having calculated chars/second, we can just wait a second
        }
    }
}
