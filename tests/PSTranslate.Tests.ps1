$ModuleManifestName = 'PSTranslate.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\PSTranslate\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}

