function Get-Translation
{
    param
    (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [String[]]
        $Value,

        [Parameter(Mandatory = $true)]
        [CultureInfo]
        $From,

        [Parameter(Mandatory = $true)]
        [CultureInfo]
        $To,

        [Parameter()]
        [string]
        $Provider = 'Azure'
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
            default { Write-Warning -Message "No implementation found for provider $Provider. Available: $($(Get-ChildItem -Path "$PSScriptRoot\..\private" -File).Foreach({[regex]::Match($_.BaseName, 'New-(\w+)Translation').Groups[1].Value}) -join ',')"}
        }
    }
}
