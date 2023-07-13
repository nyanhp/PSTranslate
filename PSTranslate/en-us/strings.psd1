# This is where the strings go, that are written by
# Write-PSFMessage, Stop-PSFFunction or the PSFramework validation scriptblocks
@{
	'Add-TranslationApiKey.ApiKey.Present'  = 'There is already an API key present for {0}. Use -Force to overwrite it.'
	'Add-TranslationApiKey.BadProvider'	    = 'Provider {0} has no implemented ApiKey storing mechanism.'
	'Get-Translation.BadProvider'		    = 'Provider {0} has not been implemented yet'
	'Get-TranslationApiKey.BadProvider'	    = 'Provider {0} has no implemented ApiKey retrieval.'
	'New-AzureTranslation.ApiKey.NotFound'  = 'No valid API key found. Try adding one with Add-TranslationApiKey -Provider Azure. See https://docs.microsoft.com/en-us/azure/cognitive-services/translator/translator-info-overview for more information.'
	'New-AzureTranslation.Preparing'	    = 'Translating from {0} to {1} using the key {2} | Final Call Uri: {3}'
	'New-AzureTranslation.AddingInput'	    = 'Adding "{0}" to collection ({1} elements)'
	'New-AzureTranslation.ExecutingBatches' = 'Requesting {0} batch(es) of translations'
	'New-AzureTranslation.ExecutionBody'    = "Using body `n`n{0}"
	'New-GoogleTranslation.ApiKey.NotFound'  = 'No valid API key found. Try adding one with Add-TranslationApiKey -Provider Google. See https://cloud.google.com/docs/authentication/production for more information.'
	'New-GoogleTranslation.Preparing'	    = 'Translating from {0} to {1} using the key {2} | Final Call Uri: {3}'
	'New-GoogleTranslation.AddingInput'	    = 'Adding "{0}" to JSON body'
	'New-GoogleTranslation.ExecutingBatches' = 'Requesting {0} translations'
	'New-GoogleTranslation.ExecutionBody'    = "Using header`n`n{0}`n`nbody`n`n{1}"
}