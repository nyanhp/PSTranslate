<#
.SYNOPSIS
    Set provider-specific options.
.DESCRIPTION
    Set provider-specific options to use with Invoke-RestMethod. Know options for Azure would
    be the regionality of the Cognitive Services that is passed in the header Ocp-Apim-Subscription-Region
.PARAMETER Provider
    The translation service to use.
.PARAMETER ExtraHeader
    The additional headers to add.
.PARAMETER ExtraQueryParameter
    The query parameters to add.
.PARAMETER ExtraPostBody
    The extra body content to add to a post if post is used.
.PARAMETER Register
    Persist the provider options, so they will be remembered in future sessions.
.PARAMETER CharacterLimit
    How many characters per defined Window will be sent to the API
.PARAMETER LimitWindow
    What Window is used?
.EXAMPLE
    Set-TranslationProviderOption -Provider Azure -ExtraHeader @{'Ocp-Apim-Subscription-Region' = 'westeurope'} -Register

    Adds regional header for Azure Cognitive Services
#>
function Set-TranslationProviderOption
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [PsfValidateSet(TabCompletion = 'PSTranslate.Provider')]
        [string]
        $Provider = (Get-PSFConfigValue -FullName 'PSTranslate.DefaultProvider'),

        [hashtable]
        $ExtraHeader,

        [hashtable]
        $ExtraQueryParameter,

        [hashtable]
        $ExtraPostBody,

        [uint64]
        $CharacterLimit = 33000, # Using Azure defaults...

        [timespan]
        $LimitWindow = '00:01:00',

        [switch]
        $Register
    )

    $config = Set-PSFConfig -Module PSTranslate -Name "$Provider.Options" -Value @{
        ExtraHeader         = $ExtraHeader
        ExtraQueryParameter = $ExtraQueryParameter
        ExtraPostBody       = $ExtraPostBody
        CharacterLimit      = $CharacterLimit
        LimitWindow         = $LimitWindow
    } -PassThru

    if (-not $Register.IsPresent) { return }

    $config | Register-PSFConfig
}