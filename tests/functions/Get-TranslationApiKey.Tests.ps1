BeforeDiscovery {
    $testCaseDefault = @(
        @{
            ApiKey   = 'My Key! My beautiful key!'
            Provider = 'Azure'
        }
    )
    $testCaseInvalidProvider = @(
        @{
            ApiKey   = 'My Key! My beautiful key!'
            Provider = 'Nice try'
        }
    )
}

Describe 'Get-TranslationApiKey' {

    Context 'Windows API key exists' {
        BeforeEach {
            Mock -CommandName Get-PSFConfigValue -MockWith { [pscredential]::new('bla', ($apiKey | ConvertTo-SecureString -AsPlainText -Force)) } -ModuleName PSTranslate
            Mock -CommandName Test-PSFPowerShell -MockWith { $true } -ModuleName PSTranslate
        }

        It '<Provider> Should get an API key' -ForEach $testCaseDefault {
            param
            (
                $Provider,
                $ApiKey
            )
            Get-TranslationApiKey -Provider $provider | Should -Be $apiKey
            Assert-MockCalled -CommandName Get-PSFConfigValue -ModuleName PSTranslate
            Assert-MockCalled -CommandName Test-PSFPowerShell -ModuleName PSTranslate
        }
    }

    Context 'Non-Windows API key exists' {
        BeforeEach {
            Mock -CommandName Get-PSFConfigValue -MockWith { $apiKey } -ModuleName PSTranslate
            Mock -CommandName Test-PSFPowerShell -MockWith { $false } -ModuleName PSTranslate
        }

        It '<Provider> Should get an API key' -ForEach $testCaseDefault {
            param
            (
                $Provider,
                $ApiKey
            )
            Get-TranslationApiKey -Provider $provider | Should -Be $apiKey
            Assert-MockCalled -CommandName Get-PSFConfigValue -ModuleName PSTranslate
            Assert-MockCalled -CommandName Test-PSFPowerShell -ModuleName PSTranslate
        }
    }

    Context 'API key missing' {
        BeforeEach {
            Mock -CommandName Get-PSFConfigValue -ModuleName PSTranslate
        }

        It '<Provider> Should get zilch' -ForEach $testCaseDefault {
            param
            (
                $Provider,
                $ApiKey
            )
            Get-TranslationApiKey -Provider $provider | Should -Be $null
            Assert-MockCalled -CommandName Get-PSFConfigValue -ModuleName PSTranslate
        }
    }

    Context 'Invalid provider' {
        It '<Provider> Should throw' -ForEach $testCaseInvalidProvider {
            param
            (
                $Provider,
                $ApiKey
            )
            { Get-TranslationApiKey -Provider $invalidProvider } | Should -Throw
        }
    }
}
    