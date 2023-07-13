# Run internal pester tests
try
{
    & "$PSScriptRoot\..\tests\pester.ps1"
    exit 0
}
catch
{
    exit 1
}
