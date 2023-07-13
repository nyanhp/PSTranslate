# This is where the strings go, that are written by
# Write-PSFMessage, Stop-PSFFunction or the PSFramework validation scriptblocks
@{
	'Add-TranslationApiKey.ApiKey.Present'  = 'Es gibt bereits einen API-Key für {0}. Bitte -Force nutzen, um ihn zu überschreiben.'
	'Add-TranslationApiKey.BadProvider'	    = 'Provider {0} implementiert keinen Mechanismus, um einen API-Key zu hinterlegen.'
	'Get-Translation.BadProvider'		    = 'Provider {0} wurde noch nicht implementiert'
	'Get-TranslationApiKey.BadProvider'	    = 'Provider {0} implementiert keinen Mechanismus, um den API-Key abzufragen'
	'New-AzureTranslation.ApiKey.NotFound'  = 'Kein gültiger API-Key gefunden. Hinzufügen mit Add-TranslationApiKey -Provider Azure. Weitere Infos unter https://docs.microsoft.com/en-us/azure/cognitive-services/translator/translator-info-overview'
	'New-AzureTranslation.Preparing'	    = 'Übersetze von {0} zu {1} mit Key {2} | Aufgerufene URI: {3}'
	'New-AzureTranslation.AddingInput'	    = 'Füge "{0}" zu Liste hinzu ({1} Elemente)'
	'New-AzureTranslation.ExecutingBatches' = 'Fordere {0} gebündelte Übersetzungen an'
	'New-AzureTranslation.ExecutionBody'    = "Benutze JSON-Body`n`n{0}"
	'New-GoogleTranslation.ApiKey.NotFound'  = 'Kein gültiger API-Key gefunden. Hinzufügen mit Add-TranslationApiKey -Provider Google. Weitere Infos unter https://cloud.google.com/docs/authentication/production'
	'New-GoogleTranslation.Preparing'	    = 'Übersetze von {0} zu {1} mit Key {2} | Aufgerufene URI: {3}'
	'New-GoogleTranslation.AddingInput'	    = 'Füge "{0}" zu JSON-Body hinzu'
	'New-GoogleTranslation.ExecutingBatches' = 'Fordere {0} Übersetzungen an'
	'New-GoogleTranslation.ExecutionBody'    = "Benutze Header`n`n{0}`n`nBody`n`n{1}"
}