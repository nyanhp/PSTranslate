BeforeDiscovery {
    [hashtable[]]$testDataDefault = @(
        @{
            From     = 'en-us'
            To       = 'de-de'
            Value    = 'Pester is the best-er'
            Provider = 'Azure'
        }
        @{
            From     = 'en-us'
            To       = 'de-de'
            Value    = 'PowerShell is awesome', 'JHP is the best', 'Friedrich is a god'
            Provider = 'Azure'
        }
    )
    [hashtable[]]$testDataWrongProvider = @(
        @{
            From     = 'en-us'
            To       = 'de-de'
            Value    = 'PowerShell is awesome', 'JHP is the best', 'Friedrich is a god'
            Provider = 'GibbetNich'
        }
    )
    [hashtable[]]$testDataWrongCulture = @(
        @{
            From     = 'klingon'
            To       = 'elvish'
            Value    = 'PowerShell is awesome', 'JHP is the best', 'Friedrich is a god'
            Provider = 'Azure'
        }
    )

    [hashtable[]]$testDataNoProvider = @(
        @{
            From  = 'en-us'
            To    = 'de-de'
            Value = 'PowerShell is awesome', 'JHP is the best', 'Friedrich is a god'
        }
    )
}

Describe 'Testing Get-Translation' {
    Context 'API key present' {
        BeforeEach {
            Mock -CommandName New-AzureTranslation -MockWith { $Value } -ModuleName PSTranslate
            Mock -CommandName Write-PSFMessage -ModuleName PSTranslate
        }

        It 'Provider <Provider> should return a translation from <From> to <To>' -ForEach $testDataDefault {
            param
            (
                $From,
                $To,
                $Value,
                $Provider
            )
            Get-Translation @PSBoundParameters | Should -Be $Value
        }

        It "Should call New-<Provider>Translation" -ForEach $testDataDefault {
            param
            (
                $From,
                $To,
                $Value,
                $Provider
            )
            $null = Get-Translation @PSBoundParameters
            Assert-MockCalled -CommandName New-AzureTranslation -Exactly -Times $Value.Count -ModuleName PSTranslate
        }
    }

    Context 'API key present, no provider given' {
        BeforeEach {
            Mock -CommandName New-AzureTranslation -MockWith { $Value } -ModuleName PSTranslate
            Mock -CommandName Get-PSFConfigValue -MockWith { 'Azure' } -ModuleName PSTranslate
            Mock -CommandName Write-PSFMessage -ModuleName PSTranslate
        }

        It 'Should call Get-PSFConfigValue exactly once'  -ForEach $testDataNoProvider {
            param
            (
                $From,
                $To,
                $Value
            )
            Get-Translation @PSBoundParameters | Should -Be $Value
            Assert-MockCalled -CommandName Get-PSFConfigValue -Exactly -Times 1 -ModuleName PSTranslate
        }
    }

    Context 'No API key present' {
        BeforeEach {
            Mock -CommandName New-AzureTranslation -MockWith { throw 'No API key :(' } -ModuleName PSTranslate
            Mock -CommandName Write-PSFMessage -ModuleName PSTranslate
        }

        It 'Should throw' -ForEach $testDataDefault {
            param
            (
                $From,
                $To,
                $Value,
                $Provider
            )
            { Get-Translation -From $From -To $To -Value $Value -Provider $Provider -ErrorAction Stop } | Should -Throw
        }
    }

    Context 'Unkown provider' {
        BeforeEach {
            Mock -CommandName Write-PSFMessage -ModuleName PSTranslate
        }

        It '<Provider> should throw' -ForEach $testDataWrongProvider {
            param
            (
                $From,
                $To,
                $Value,
                $Provider
            )
            if (-not (Get-Command -Name "New-$($Provider)Translation" -ErrorAction SilentlyContinue))
            {
                $null = New-Item -Path "function:\New-$($Provider)Translation" -Value {}
            }
            Mock -CommandName "New-$($Provider)Translation"
            { Get-Translation -From $From -To $To -Value $Value -Provider $Provider -ErrorAction Stop }  | Should -Throw
        }
    }
}
