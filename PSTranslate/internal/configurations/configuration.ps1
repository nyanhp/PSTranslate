<#
This is an example configuration file

By default, it is enough to have a single one of them,
however if you have enough configuration settings to justify having multiple copies of it,
feel totally free to split them into multiple files.
#>

<#
# Example Configuration
Set-PSFConfig -Module 'PSTranslate' -Name 'Example.Setting' -Value 10 -Initialize -Validation 'integer' -Handler { } -Description "Example configuration setting. Your module can then use the setting using 'Get-PSFConfigValue'"
#>

Set-PSFConfig -Module 'PSTranslate' -Name 'Import.DoDotSource' -Value $false -Initialize -Validation 'bool' -Description "Whether the module files should be dotsourced on import. By default, the files of this module are read as string value and invoked, which is faster but worse on debugging."
Set-PSFConfig -Module 'PSTranslate' -Name 'Import.IndividualFiles' -Value $false -Initialize -Validation 'bool' -Description "Whether the module files should be imported individually. During the module build, all module code is compiled into few files, which are imported instead by default. Loading the compiled versions is faster, using the individual files is easier for debugging and testing out adjustments."

# General
Set-PSFConfig -Module 'PSTranslate' -Name 'DefaultProvider' -Value 'Azure' -Initialize -Validation String -Description 'The default service to contact for translation services.'

# Azure Cognitive Services
if (Test-PSFPowerShell -OperatingSystem Windows)
{
	Set-PSFConfig -Module 'PSTranslate' -Name 'Azure.ApiKey' -Value $null -Initialize -Validation credential -Description 'The API key used to connect to the Azure Cognitive Translation Services'
}
else { Set-PSFConfig -Module 'PSTranslate' -Name 'Azure.ApiKey' -Value $null -Initialize -Validation string -Description 'The API key used to connect to the Azure Cognitive Translation Services' }

# Google Translation API
if (Test-PSFPowerShell -OperatingSystem Windows)
{
	Set-PSFConfig -Module 'PSTranslate' -Name 'Google.ApiKey' -Value $null -Initialize -Validation credential -Description 'The API key used to connect to the Azure Cognitive Translation Services'
}
else { Set-PSFConfig -Module 'PSTranslate' -Name 'Google.ApiKey' -Value $null -Initialize -Validation string -Description 'The API key used to connect to the Azure Cognitive Translation Services' }