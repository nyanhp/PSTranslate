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
