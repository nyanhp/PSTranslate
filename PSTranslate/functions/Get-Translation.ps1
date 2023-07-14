function Get-Translation
{
<#
	.SYNOPSIS
		Translates text from one language to another.

	.DESCRIPTION
		Translates text from one language to another.

	.PARAMETER Value
		The text to translate.

	.PARAMETER From
		THe language to translate the text from.

	.PARAMETER To
		The language to translate the text to.

	.PARAMETER Provider
		The translation service to use.

	.EXAMPLE
		PS C:\> Get-Content .\essay.md | Get-Translation -From en -To de

		Translates the content of essay.md from English to German.
#>
	[CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [String[]]
        $Value,

        [Parameter(Mandatory = $true)]
        [CultureInfo]
        $From,

        [Parameter(Mandatory = $true)]
        [CultureInfo]
        $To,

        [Parameter()]
		[PsfValidateSet(TabCompletion = 'PSTranslate.Provider')]
        [string]
        $Provider = (Get-PSFConfigValue -FullName 'PSTranslate.DefaultProvider')
    )

    begin
    {
        $pipeCollection = New-Object -TypeName 'System.Collections.Generic.List[string]'
    }

    process
    {
        if ($Value.Count -eq 1)
        {
            $pipeCollection.Add($Value)
        }
        else
        {
            $pipeCollection.AddRange($Value)
        }
    }

    end
    {
        switch ($Provider)
        {
            'Azure' { $pipeCollection | New-AzureTranslation -From $From -To $To }
		}
	}
}
