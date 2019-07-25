Register-PSFTeppScriptblock -Name "PSTranslate.Provider" -ScriptBlock {
	'Azure'
}

Register-PSFTeppScriptblock -Name 'PSTranslate.Culture' -ScriptBlock {
	[cultureinfo]::GetCultures('AllCultures').Name
}
