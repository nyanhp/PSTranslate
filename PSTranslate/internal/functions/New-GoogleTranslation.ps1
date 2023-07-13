function New-GoogleTranslation
{
<#
	.SYNOPSIS
		Uses Google Translation API to translate text.

	.DESCRIPTION
		Uses Google Translation API to translate text.

	.PARAMETER Value
		The text to translate.

	.PARAMETER From
		The language to translate from.

	.PARAMETER To
		The language to translate to.

	.PARAMETER ApiVersion
		The API version to use.

	.EXAMPLE
		PS C:\> $text | New-GoogleTranslation -From $From -To $To

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
        $ApiVersion = '2'
    )

    begin
    {
        $googleUri = 'https://translation.googleapis.com/language/translate/v{0}' -f $ApiVersion
        $key = Get-TranslationApiKey -Provider Google

        if (-not $key)
		{
			Stop-PSFFunction -String 'New-GoogleTranslation.ApiKey.NotFound'
            return
        }

        $header = @{
            Authorization = "Bearer $key"
        }

        $body = @{
            source = $From.TwoLetterISOLanguageName
            target = $To.TwoLetterISOLanguageName
            q      = New-Object -TypeName 'System.Collections.Generic.List[string]'
        }

		Write-PSFMessage -String 'New-GoogleTranslation.Preparing' -StringValues $From.TwoLetterISOLanguageName, $To.TwoLetterISOLanguageName, $($(-join $key[0, 1]) + $('*' * 28) + $(-join $key[-2, -1])), $googleUri
    }

    process
    {
        Write-PSFMessage -String 'New-GoogleTranslation.AddingInput' -StringValues $Value
        $body.q.Add($Value)
    }

    end
    {
        Write-PSFMessage -String 'New-GoogleTranslation.ExecutingBatches' -StringValues $body.q.Count
        $jsonBody = ConvertTo-Json -InputObject $body
        Write-PSFMessage -Level Debug -String 'New-GoogleTranslation.ExecutionBody' -StringValues ($header | Out-String),$jsonBody
        (Invoke-RestMethod -Method Post -Uri $googleUri -Headers $header -Body $jsonBody -UseBasicParsing -ContentType 'application/json; charset=utf-8').Content
    }
}
