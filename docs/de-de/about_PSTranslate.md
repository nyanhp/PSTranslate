# PSTranslate
## about_PSTranslate

# SHORT DESCRIPTION
Module for modern text translation.

# LONG DESCRIPTION
Modul für moderne Textübersetzung. Unterstützt derzeit Azure Cognitive Services,
und kann mit verschiedenen Anbietern einfach erweitert werden.

# EXAMPLES
Add-TranslationApiKey -Provider Azure -ApiKey TheKey -Force -Register
Set-TranslationProviderOption -Provider Azure -ExtraHeader @{'Ocp-Apim-Subscription-Region' = 'westeurope'} -Register
Get-Translation -$Value = 'PowerShell is awesome' -From en-us -To de-de

# NOTE
Erfordert (potenziell kostenpflichtige) Abonnements für unterstützte Übersetzungsanbieter.
Azure Cognitive Services bietet einen kostenlosen Tarif, der für den
persönlichen Gebrauch mehr als ausreichend ist.

# SEE ALSO
Azure Cognitive Services (Translate) docs
