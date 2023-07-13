# PSTranslate
## about_PSTranslate

# SHORT DESCRIPTION
Module for modern text translation.

# LONG DESCRIPTION
Module for modern text translation. Currently supports Azure
Cognitive Services, easy to extend using different providers.

# EXAMPLES
Add-TranslationApiKey -Provider Azure -ApiKey TheKey -Force -Register
Set-TranslationProviderOption -Provider Azure -ExtraHeader @{'Ocp-Apim-Subscription-Region' = 'westeurope'} -Register
Get-Translation -$Value = 'PowerShell is awesome' -From en-us -To de-de

# NOTE
Requires (potentially paid) subscription(s) to supported
translation providers. Azure Cognitive Services offers
a free tier which is more than enough for personal use.

# SEE ALSO
Azure Cognitive Services (Translate) docs
