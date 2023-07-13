@{
    # Script module or binary module file associated with this manifest
    ModuleToProcess      = 'PSTranslate.psm1'
	
    # Version number of this module.
    ModuleVersion        = '2.0.0'
	
    # ID used to uniquely identify this module
    GUID                 = 'b066a7ac-3ba4-4814-9991-7ccf6cb96234'
	
    # Author of this module
    Author               = 'Jan-Hendrik Peters'
	
    # Company or vendor of this module
    CompanyName          = 'Jan-Hendrik Peters'
	
    # Copyright statement for this module
    Copyright            = 'Copyright (c) 2023 Jan-Hendrik Peters'
	
    # Description of the functionality provided by this module
    Description          = 'Module for modern text translation.'
	
    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion    = '5.1'

    CompatiblePSEditions = @(
        'Core'
        'Desktop'
    )
	
    # Modules that must be imported into the global environment prior to importing
    # this module
    RequiredModules      = @(
        @{ ModuleName = 'PSFramework'; ModuleVersion = '1.8.291' }
    )
	
    # Functions to export from this module
    FunctionsToExport    = @(
        'Add-TranslationApiKey'
        'Get-Translation'
        'Get-TranslationApiKey'
        'Set-TranslationProviderOption'
    )
	
    # Cmdlets to export from this module
    CmdletsToExport      = ''
	
    # Variables to export from this module
    VariablesToExport    = ''
	
    # Aliases to export from this module
    AliasesToExport      = ''
	
    # List of all modules packaged with this module
    ModuleList           = @()
	
    # List of all files packaged with this module
    FileList             = @()
	
    # Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{
		
        #Support for PowerShellGet galleries.
        PSData = @{
			
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = @('Translation', 'Translate', 'CognitiveServices')
			
            # A URL to the license for this module.
            LicenseUri = 'https://github.com/nyanhp/PSTranslate/blob/main/LICENSE'
			
            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/nyanhp/PSTranslate'
			
            # A URL to an icon representing this module.
            # IconUri = ''
			
            # ReleaseNotes of this module
            # ReleaseNotes = ''
			
        } # End of PSData hashtable
		
    } # End of PrivateData hashtable
}