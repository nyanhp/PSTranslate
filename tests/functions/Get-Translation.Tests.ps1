$modulePath = Resolve-Path -Path "$PSScriptRoot\..\..\PSTranslate.psd1" -ErrorAction Stop

Remove-Module PSTranslate -Force
Import-Module -Name $modulePath.Path, PSFramework -Force

InModuleScope -ModuleName PSTranslate {
    Describe 'Testing Get-Translation' {
        $testData = @{
            From     = 'en-us'
            To       = 'de-de'
            Value    = 'PowerShell is awesome', 'JHP is the best', 'Friedrich is a god'
            Provider = 'Azure'
        }

        Context 'API key present' {

            $result = 'PowerShell ist irre', 'JHP ist der beste', 'Friedrich ist ein Gott'
            $script:counter = 0
            Mock -CommandName New-AzureTranslation -MockWith { $result[$script:counter]; $script:counter++ }

            It 'Should return a translation' {
                Get-Translation @testData | Should -Be $result
            }

            It "Should call New-$($testData.Provider)Translation exactly $($testData.Value.Count) times" {
                Assert-MockCalled -CommandName New-AzureTranslation -Exactly -Times $testData.Value.Count
            }
        }

        Context 'API key present, no provider given' {
            $thisTest = $testData.Clone()
            $thisTest.remove('Provider')
            $result = 'PowerShell ist irre', 'JHP ist der beste', 'Friedrich ist ein Gott'
            $script:counter = 0
            Mock -CommandName New-AzureTranslation -MockWith { $result[$script:counter]; $script:counter++ }
            Mock -CommandName Get-PSFConfigValue -MockWith { 'Azure' }

            It 'Should return a translation' {
                Get-Translation @thisTest | Should -Be $result
            }

            It "Should call New-AzureTranslation exactly $($testData.Value.Count) times" {
                Assert-MockCalled -CommandName New-AzureTranslation -Exactly -Times $testData.Value.Count
            }

            It 'Should call Get-PSFConfigValue exactly once' {
                Assert-MockCalled -CommandName Get-PSFConfigValue -Exactly -Times 1
            }
        }

        Context 'No API key present' {
            Mock -CommandName New-AzureTranslation -MockWith { throw 'No API key :(' }

            It 'Should throw' {
                { Get-Translation @testData } | Should -Throw
            }
        }

        Context 'Unkown provider' {
            $testData.Provider = 'ComputerSayNooooo'

            It 'should throw' {
                {Get-Translation @testData} | Should -Throw
            }
        }
    }
}
