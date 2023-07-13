<#
This file loads the strings documents from the respective language folders.
This allows localizing messages and errors.
Load psd1 language files for each language you wish to support.
Partial translations are acceptable - when missing a current language message,
it will fallback to English or another available language.
#>
$root = Get-Item -Path $PSScriptRoot
if ($root.BaseName -eq 'scripts') { $root = $root.Parent.Parent}
Import-PSFLocalizedString -Path (Join-Path -Path $root.FullName -ChildPath /en-us/*.psd1) -Module 'PSTranslate' -Language 'en-US'