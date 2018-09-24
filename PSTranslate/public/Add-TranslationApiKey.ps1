function Add-TranslationApiKey
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [string]
        $ApiKey,

        [Parameter(Mandatory = $true)]
        [string]
        $Provider,

        [switch]
        $Force
    )

    $path = Join-Path -Path $HOME -ChildPath '.pstranslate'

    if (-not (Test-Path -Path $path))
    {
        [void] (New-Item -ItemType Directory -Path $path)
    }

    $providerKeyFile = Get-ChildItem -Path $path -Filter $Provider

    if ($providerKeyFile -and -not $Force)
    {
        Write-Warning -Message "Skipping overwrite of existing API key in $providerKeyFile"
        return
    }

    $providerKeyFile = Join-Path -Path $path -ChildPath $Provider
    Set-Content -Value $ApiKey -Path $providerKeyFile -Force
}
