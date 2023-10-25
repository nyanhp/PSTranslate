Register-PSFTeppScriptblock -Name "PSTranslate.Provider" -ScriptBlock {
	'Azure', 'Google'
}

Register-PSFTeppScriptblock -Name 'PSTranslate.Culture' -ScriptBlock {
	[cultureinfo]::GetCultures('AllCultures').Name
}
