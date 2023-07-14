BeforeDiscovery {
    $testCases = @(
        @{
            ExtraHeader = @{
                Bla = 'blub'
            }
        }
        @{
            Provider    = 'Azure'
            ExtraHeader = @{
                Bla = 'blub'
            }
        }
        @{
            Provider            = 'Azure'
            ExtraQueryParameter = @{
                Bla = 'blub'
            }
        }
        @{
            Provider      = 'Azure'
            ExtraPostBody = @{
                Bla = 'blub'
            }
        }
        @{
            Provider            = 'Azure'
            ExtraHeader         = @{
                Bla = 'blub'
            }
            ExtraPostBody       = @{
                Bla = 'blub'
            }
            ExtraQueryParameter = @{
                Bla = 'blub'
            }
        }
    )
}

Describe 'Set-TranslationProviderOption' {
    BeforeEach {
        Mock -CommandName Get-PSFConfigValue -ParameterFilter { $FullName -eq 'PSTranslate.DefaultProvider' } -MockWith { 'Azure' } -ModuleName PSTranslate
    }
    Context 'No Registration' {
        BeforeEach {
            Mock -CommandName Set-PSFConfig -MockWith { 'something' } -Verifiable -ModuleName PSTranslate
        }

        It '<Provider> should receive new settings' -ForEach $testCases {
            param
            (
                $Provider,
                $ExtraHeader,
                $ExtraQueryParameter,
                $ExtraPostBody
            )
            Set-TranslationProviderOption @PSBoundParameters
            Should -InvokeVerifiable
        }
    }

    Context 'Registration' {
        BeforeEach {
            Mock -CommandName Set-PSFConfig -MockWith { 'something' }-Verifiable -ModuleName PSTranslate
            Mock -CommandName Register-PSFConfig -Verifiable -ModuleName PSTranslate
        }

        It '<Provider> should register new settings' -ForEach $testCases {
            param
            (
                $Provider,
                $ExtraHeader,
                $ExtraQueryParameter,
                $ExtraPostBody
            )
            Set-TranslationProviderOption @PSBoundParameters -Register
            Should -InvokeVerifiable
        }
    }
}