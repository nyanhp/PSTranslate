$modulePath = Resolve-Path -Path "$PSScriptRoot\..\..\PSTranslate.psd1" -ErrorAction Stop

Remove-Module PSTranslate -Force
Import-Module -Name $modulePath.Path, PSFramework -Force

InModuleScope -ModuleName PSTranslate {
    Describe 'Get-TranslationApiKey' {
        $apiKey = 'My Key! My beautiful key!'
        $provider = 'Azure'
        $invalidProvider = 'Nice try'

        Context 'Windows API key exists' {
            Mock -CommandName Get-PSFConfigValue -MockWith { [pscredential]::new('bla', ($apiKey | ConvertTo-SecureString -AsPlainText -Force)) }
            Mock -CommandName Test-PSFPowerShell -MockWith { $true }

            It 'Should get an API key' {
                Get-TranslationApiKey -Provider $provider | Should -Be $apiKey
            }

            It 'Should call the mocks' {
                Assert-MockCalled -CommandName Get-PSFConfigValue
                Assert-MockCalled -CommandName Test-PSFPowerShell
            }
        }

        Context 'Non-Windows API key exists' {
            Mock -CommandName Get-PSFConfigValue -MockWith { $apiKey }
            Mock -CommandName Test-PSFPowerShell -MockWith { $false }

            It 'Should get an API key' {
                Get-TranslationApiKey -Provider $provider | Should -Be $apiKey
            }

            It 'Should call the mocks' {
                Assert-MockCalled -CommandName Get-PSFConfigValue
                Assert-MockCalled -CommandName Test-PSFPowerShell
            }
        }

        Context 'API key missing' {
            Mock -CommandName Get-PSFConfigValue

            It 'Should get zilch' {
                Get-TranslationApiKey -Provider $provider | Should -Be $null
            }

            It 'Should call the mocks' {
                Assert-MockCalled -CommandName Get-PSFConfigValue
            }
        }

        Context 'Invalid provider' {
            It 'Should throw' {
                { Get-TranslationApiKey -Provider $invalidProvider } | Should -Throw
            }
        }
    }
}
