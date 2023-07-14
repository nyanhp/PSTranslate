BeforeDiscovery {
    $testCaseDefault = @(
        @{
            ApiKey   = 'My Key! My beautiful key!'
            Provider = 'Azure'
        }
    )
    $testCaseWrongProvider = @(
        @{
            ApiKey   = 'My Key! My beautiful key!'
            Provider = 'Nope'
        }
    )
}

Describe 'Add-TranslationApiKey' {
    BeforeEach {
        Mock -CommandName Get-PSFConfigValue -ModuleName PSTranslate
        Mock -CommandName Write-PSFMessage -ModuleName PSTranslate
        Mock -CommandName Test-PSFPowerShell -ModuleName PSTranslate
        Mock -CommandName ConvertTo-SecureString -ModuleName PSTranslate
        Mock -CommandName New-Object -ModuleName PSTranslate
        Mock -CommandName Set-PSFConfig -ModuleName PSTranslate
        Mock -CommandName Register-PSFConfig -ModuleName PSTranslate
    }

    Context 'Wrong provider' {
        It '<Provider> Should throw' -ForEach $testCaseWrongProvider {
            param
            (
                $ApiKey,
                $Provider
            )
            { Add-TranslationApiKey -ApiKey $ApiKey -Provider $Provider -ErrorAction Stop } | Should -Throw
        }
    }

    Context 'Windows No key exist yet, no registration' {
        BeforeEach {
            Mock -CommandName Get-PSFConfigValue -Verifiable -ModuleName PSTranslate
            Mock -CommandName Write-PSFMessage -ModuleName PSTranslate
            Mock -CommandName Test-PSFPowerShell -Verifiable -MockWith { $true } -ModuleName PSTranslate
            Mock -CommandName ConvertTo-SecureString -Verifiable -MockWith { [securestring]::new() } -ModuleName PSTranslate
            Mock -CommandName New-Object -Verifiable -MockWith { [pscredential]::new('blub', [securestring]::new()) } -ModuleName PSTranslate
            Mock -CommandName Set-PSFConfig -Verifiable -ModuleName PSTranslate
        }

        It '<Provider> should add API key <ApiKey>' -ForEach $testCaseDefault {
            param
            (
                $ApiKey,
                $Provider
            )
            $null = Add-TranslationApiKey @PSBoundParameters
            Should -InvokeVerifiable
        }
    }
    Context 'Non-Windows No key exist yet, no registration' {
        BeforeEach {
            Mock -CommandName Get-PSFConfigValue -Verifiable -ModuleName PSTranslate
            Mock -CommandName Test-PSFPowerShell -Verifiable -MockWith { $false } -ModuleName PSTranslate
            Mock -CommandName Set-PSFConfig -Verifiable -ModuleName PSTranslate
        }

        It '<Provider> should add API key <ApiKey>' -ForEach $testCaseDefault {
            param
            (
                $ApiKey,
                $Provider
            )
            $null = Add-TranslationApiKey @PSBoundParameters
            Should -InvokeVerifiable
        }
    }

    Context 'No key exist yet, registration' {
        BeforeEach {
            Mock -CommandName Get-PSFConfigValue -Verifiable -ModuleName PSTranslate
            Mock -CommandName Write-PSFMessage -ModuleName PSTranslate
            Mock -CommandName Test-PSFPowerShell -Verifiable -MockWith { $true } -ModuleName PSTranslate
            Mock -CommandName ConvertTo-SecureString -Verifiable -MockWith { [securestring]::new() } -ModuleName PSTranslate
            Mock -CommandName New-Object -Verifiable -MockWith { [pscredential]::new('blub', [securestring]::new()) } -ModuleName PSTranslate
            Mock -CommandName Set-PSFConfig -Verifiable -MockWith { 'something' } -ModuleName PSTranslate
            Mock -CommandName Register-PSFConfig -Verifiable -ModuleName PSTranslate
        }

        It '<Provider> should add API key <ApiKey>' -ForEach $testCaseDefault {
            param
            (
                $ApiKey,
                $Provider
            )
            $null = Add-TranslationApiKey @PSBoundParameters -Register
            Should -InvokeVerifiable
        }
    }

    Context 'Key exists, no registration' {
        BeforeEach {
            Mock -CommandName Get-PSFConfigValue -MockWith { 'Something' } -Verifiable -ModuleName PSTranslate
            Mock -CommandName Write-PSFMessage -Verifiable -ModuleName PSTranslate
        }

        It '<Provider> write warning and return' -ForEach $testCaseDefault {
            param
            (
                $ApiKey,
                $Provider
            )
            $null = Add-TranslationApiKey @PSBoundParameters
            Should -InvokeVerifiable
        }
    }
}
    