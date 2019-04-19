function Get-TranslationApiKey
{
    param
    (
        [Parameter()]
        [string]
        $Provider
    )

    $path = Join-Path -Path $HOME -ChildPath '.pstranslate' -Resolve

    Get-ChildItem -Path $path -Filter $Provider | Get-Content
}
