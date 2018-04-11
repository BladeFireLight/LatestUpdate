Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Trusted'

Write-Host -Object "`nInstalling package providers:" -ForegroundColor 'Yellow'
$providerNames = 'NuGet', 'PowerShellGet'
ForEach ( $providerName in $providerNames ) {
    If ( -not ( Get-PackageProvider $providerName -ErrorAction 'SilentlyContinue' ) ) {
        Install-PackageProvider -Name $providerName -Scope 'CurrentUser' -Force -ForceBootstrap
    }
}
Remove-Variable -Name 'providerName'

Get-PackageProvider -Name $providerNames |
    Format-Table -AutoSize -Property 'Name', 'Version'

Write-Host -Object "Installing modules:" -ForegroundColor 'Yellow'
$moduleNames = 'Pester', 'Coveralls', 'PSScriptAnalyzer'
ForEach ( $moduleName in $moduleNames ) {
    If ( $env:APPVEYOR_BUILD_WORKER_IMAGE -eq 'WMF 5' ) {
        Install-Module -Name $moduleName -Scope 'CurrentUser' -Repository 'PSGallery' -Force -Confirm:$false |
            Out-Null
    }
    Else {
        Install-Module -Name $moduleName -Scope 'CurrentUser' -Repository 'PSGallery' -SkipPublisherCheck -Force -Confirm:$false |
            Out-Null
    }
    Import-Module -Name $moduleName
}
Remove-Variable -Name 'moduleName'

Get-Module -Name $moduleNames |
    Format-Table -AutoSize -Property 'Name', 'Version'

Write-Host -Object ''
