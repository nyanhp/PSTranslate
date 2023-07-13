<#
This script publishes the module to the gallery.
It expects as input an ApiKey authorized to publish the module.

Insert any build steps you may need to take before publishing it here.
#>
param (
	$ApiKey,
	
	$WorkingDirectory,
	
	$Repository = 'PSGallery',
	
	[switch]
	$LocalRepo,
	
	[switch]
	$SkipPublish,
	
	[switch]
	$AutoVersion
)

#region Handle Working Directory Defaults
if (-not $WorkingDirectory)
{
	if ($env:RELEASE_PRIMARYARTIFACTSOURCEALIAS)
	{
		$WorkingDirectory = Join-Path -Path $env:SYSTEM_DEFAULTWORKINGDIRECTORY -ChildPath $env:RELEASE_PRIMARYARTIFACTSOURCEALIAS
	}
	else { $WorkingDirectory = $env:SYSTEM_DEFAULTWORKINGDIRECTORY }
}
if (-not $WorkingDirectory) { $WorkingDirectory = Split-Path $PSScriptRoot }
#endregion Handle Working Directory Defaults

# Prepare publish folder
Write-Host "Creating and populating publishing directory"
$publishDir = New-Item -Path $WorkingDirectory -Name publish -ItemType Directory -Force
Copy-Item -Path "$($WorkingDirectory)\PSTranslate" -Destination $publishDir.FullName -Recurse -Force

# Compile help
$helpBase = Join-Path -Path $WorkingDirectory -ChildPath docs
foreach ($dir in ($helpBase | Get-ChildItem -Directory))
{
	$null = mkdir -ErrorAction SilentlyContinue -Force -Path (Join-Path -Path $publishDir -ChildPath $dir.BaseName)
	$null = New-ExternalHelp -Path $dir.FullName -OutputPath (Join-Path -Path $publishDir -ChildPath "PSTranslate/$($dir.BaseName)") -Force
}

#region Gather text data to compile
$text = @()

# Gather commands
Get-ChildItem -Path "$($publishDir.FullName)\PSTranslate\internal\functions\" -Recurse -File -Filter "*.ps1" | ForEach-Object {
	$text += [System.IO.File]::ReadAllText($_.FullName)
}
Get-ChildItem -Path "$($publishDir.FullName)\PSTranslate\functions\" -Recurse -File -Filter "*.ps1" | ForEach-Object {
	$text += [System.IO.File]::ReadAllText($_.FullName)
}

# Gather scripts
Get-ChildItem -Path "$($publishDir.FullName)\PSTranslate\internal\scripts\" -Recurse -File -Filter "*.ps1" | ForEach-Object {
	$text += [System.IO.File]::ReadAllText($_.FullName)
}

#region Update the psm1 file & Cleanup
[System.IO.File]::WriteAllText("$($publishDir.FullName)\PSTranslate\PSTranslate.psm1", ($text -join "`n`n"), [System.Text.Encoding]::UTF8)
Remove-Item -Path "$($publishDir.FullName)\PSTranslate\internal" -Recurse -Force
Remove-Item -Path "$($publishDir.FullName)\PSTranslate\functions" -Recurse -Force
#endregion Update the psm1 file & Cleanup

#region Publish
if ($SkipPublish) { return }
if ($LocalRepo)
{
	# Dependencies must go first
	Write-Host  "Creating Nuget Package for module: PSFramework"
	New-PSMDModuleNugetPackage -ModulePath (Get-Module -Name PSFramework).ModuleBase -PackagePath .
	Write-Host  "Creating Nuget Package for module: PSTranslate"
	New-PSMDModuleNugetPackage -ModulePath "$($publishDir.FullName)\PSTranslate" -PackagePath .
	return
}

# Update Changelog
$manifest = Import-PowerShellDataFile -Path "$($publishDir.FullName)\PSTranslate\PSTranslate.psd1"
$moduleversion = $manifest.ModuleVersion
$manipar = @{
	ReleaseNotes = $changelog.Released.Where({ $_.Version -eq $changelog.LastVersion }).RawData
	Path         = "$($publishDir.FullName)\PSTranslate\PSTranslate.psd1"
}

$branch = $env:GITHUB_REF_NAME

if ($branch -notin 'main','development')
{
	Write-Host 'You should not be here...'
	return
}

Write-Host "Working in branch $branch"
if ($branch -eq 'development')
{
	Write-Host 'Branch is development, prepping prerelease'
	$manipar['Prerelease'] = 'pre{0}' -f (Get-Date -Format yyyyMMddHHmmss)
	$moduleversion = "$moduleversion-$($manipar['Prerelease'] )"
}

$null = Update-Changelog -ReleaseVersion $moduleversion -LinkMode None -Path "$($publishDir.FullName)\PSTranslate\changelog.md"
$changelog = Get-ChangelogData -Path "$($publishDir.FullName)\PSTranslate\changelog.md"

$manipar.ReleaseNotes = $changelog.ReleaseNotes
Update-ModuleManifest @manipar

# Publish to Gallery
Write-Host  "Publishing the PSTranslate module to $($Repository)"
Publish-Module -Path "$($publishDir.FullName)\PSTranslate" -NuGetApiKey $ApiKey -Force -Repository $Repository

#endregion Publish