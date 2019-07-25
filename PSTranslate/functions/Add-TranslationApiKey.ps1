function Add-TranslationApiKey
{
<#
	.SYNOPSIS
		Stores API Keys for the APIs used to translate text.

	.DESCRIPTION
		Stores API Keys for the APIs used to translate text.

	.PARAMETER ApiKey
		The API Key to store.

	.PARAMETER Provider
		The provider for which to store the API Key

	.PARAMETER Force
		Overwrite existing API Keys

	.PARAMETER Register
		Persist the API key, so it will be remembered in future sessions.
		On Windows, this is written to registry using windows encryption.
		On Linux this is stored in plaintext in file.

	.EXAMPLE
		PS C:\> Add-TranslationApiKey -ApiKey 'c01d33ba-5af9-4528-b6be-61cdb94820c1' -Provider 'azure'

		Adds an API key to connect to azure with.
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingConvertToSecureStringWithPlainText", "")]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [string]
        $ApiKey,

		[Parameter(Mandatory = $true)]
		[PsfValidateSet(TabCompletion = 'PSTranslate.Provider')]
        [string]
        $Provider,

        [switch]
		$Force,

		[switch]
		$Register
	)

	process
	{
		switch ($Provider)
		{
			'Azure'
			{
				$cred = Get-PSFConfigValue -FullName 'PSTranslate.Azure.ApiKey'
				if ($cred -and -not $Force)
				{
					Write-PSFMessage -Level Warning -String 'Add-TranslationApiKey.ApiKey.Present' -StringValues $Provider
					return
				}
				if (Test-PSFPowerShell -OperatingSystem Windows)
				{
					$secureKey = $ApiKey | ConvertTo-SecureString -AsPlainText -Force
					$cred = New-Object PSCredential($Provider, $secureKey)
					Set-PSFConfig -Module PSTranslate -Name Azure.ApiKey -Value $cred
				}
				else { Set-PSFConfig -Module PSTranslate -Name Azure.ApiKey -Value $ApiKey }

				if ($Register)
				{
					Register-PSFConfig -Module PSTranslate -Name Azure.ApiKey
				}
				break
			}
			default
			{
				Write-PSFMessage -Level Warning -String 'Add-TranslationApiKey.BadProvider' -StringValues $Provider
			}
		}
	}
}
