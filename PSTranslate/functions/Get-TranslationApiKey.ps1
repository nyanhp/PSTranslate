function Get-TranslationApiKey
{
<#
	.SYNOPSIS
		Returns an API key used for translation services.
	
	.DESCRIPTION
		Returns an API key used for translation services.
	
	.PARAMETER Provider
		The provider to return the API key for.
	
	.EXAMPLE
		PS C:\> Get-TranslationApiKey -Provider 'Azure'
	
		Returns the API key for connectign to azure translation services.
#>
	[CmdletBinding()]
    param
	(
		[Parameter(Mandatory = $true)]
		[PsfValidateSet(TabCompletion = 'PSTranslate.Provider')]
        [string]
        $Provider
    )
	
	process
	{
		switch ($Provider)
		{
			'Azure'
			{
				$cred = Get-PSFConfigValue -FullName 'PSTranslate.Azure.ApiKey'
				if ($cred)
				{
					if (Test-PSFPowerShell -OperatingSystem Windows) { $cred.GetNetworkCredential().Password }
					else { $cred }
				}
				break
			}
		}
	}
}
