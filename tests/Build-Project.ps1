$projectNameLowerCase = $env:CI_PROJECT_NAME.ToLower()

$text = @{
    'AppVeyor'              = 'AppVeyor'
    'AppVeyorImageUrl'      = 'https://img.shields.io/appveyor/ci/aaronparker/latestupdate/master.svg?style=flat-square&logo=appveyor'
    'AppVeyorProjectUrl'    = "https://ci.appveyor.com/project/${env:CI_OWNER_NAME}/${env:CI_PROJECT_NAME}/branch/master"
    'AvailableOnGitHub'     = 'available on GitHub'
    'BoldForm'              = '**{0}**'
    'BuildStatus'           = 'Build Status'
    'CoverageStatus'        = 'Coverage Status'
    'Coveralls'             = 'Coveralls'
    'CoverallsImageUrl'     = "https://coveralls.io/repos/github/${env:CI_OWNER_NAME}/${env:CI_PROJECT_NAME}/badge.svg?branch=master"
    'CoverallsProjectUrl'   = "https://coveralls.io/github/${env:CI_OWNER_NAME}/${env:CI_PROJECT_NAME}?branch=master"
    'CurrentVersion'        = 'Current Version'
    'DocumentationStatus'   = 'Documentation Status'
    'LatestBuild'           = "${env:CI_PROJECT_NAME}: Latest Build"
    'macOS'                 = 'macOS'
    'MdBoldLinkForm'        = "**[{0}]({1} '{2}')**"
    'MdImageForm'           = '[![{0}]({1})]({2}) '
    'MdLinkForm'            = "[{0}]({1} '{2}')"
    'Pester'                = 'Pester'
    'PesterUrl'             = 'https://github.com/pester/Pester'
    'ProductPage'           = 'Product Page'
    'PSDownloadsImageUrl'   = "https://img.shields.io/powershellgallery/dt/${env:CI_MODULE_NAME}.svg"
    'PSGallery'             = 'PowerShell Gallery'
    'PSGalleryImageUrl'     = "https://img.shields.io/powershellgallery/v/${env:CI_MODULE_NAME}.svg"
    'PSGalleryProjectUrl'   = "https://www.powershellgallery.com/packages/${env:CI_MODULE_NAME}"
    'ReadTheDocs'           = 'ReadTheDocs'
    'ReadTheDocsImageUrl'   = "https://readthedocs.org/projects/${projectNameLowerCase}/badge/?version=latest"
    'ReadTheDocsProjectUrl' = "http://${projectNameLowerCase}.readthedocs.io/en/latest/?badge=latest"
    'RepoUrl'               = "https://github.com/${env:CI_OWNER_NAME}/${env:CI_PROJECT_NAME}"
    'RestfulApi'            = 'RESTful APIs'
    'RstLinkForm'           = '`{0}`_'
    'RstImageForm'          = ".. image:: {0}`r`n   :target: {1}`r`n   :alt: {2}`r`n`r`n"
    'RstLinkMap'            = ".. _{0}: {1}`r`n`r`n"
    'Title'                 = 'LatestUpdate'
    'TotalDownloads'        = 'Total Downloads'
    'TravisCi'              = 'Travis CI'
    'TravisCiImageUrl'      = "https://travis-ci.org/${env:CI_OWNER_NAME}/${env:CI_PROJECT_NAME}.svg?branch=master"
    'TravisCiProjectUrl'    = "https://travis-ci.org/${env:CI_OWNER_NAME}/${env:CI_PROJECT_NAME}"
    'Ubuntu'                = 'Ubuntu Linux'
    'Windows'               = 'Windows'
}

# Add formatted versions of entries above
$text += @{
    'LatestBuildConsole' = "$( $text.LatestBuild ) Console"
}

# Add more formatted versions of entries above
$text += @{
    'AppVeyorMdLinkTitle'      = "$( $text.AppVeyor ): $( $text.LatestBuildConsole )"
    'CoverallsMdLinkTitle'     = "$( $text.Coveralls ): ${env:CI_PROJECT_NAME}: Latest Report"
    'PesterMdLinkTitle'        = "$( $text.Pester ) GitHub repo"
    'PSGalleryMdLinkTitle'     = $text.PSGallery
    'ReadTheDocsMdLinkTitle'   = "$( $text.ReadTheDocs ): $( $text.LatestBuild )"
    'RestfulApiMdLinkTitle'    = 'Armor API Guide'
    'TravisCiMdLinkTitle'      = "$( $text.TravisCi ): $( $text.LatestBuildConsole )"
}

# Add more formatted versions of entries above
$text += @{
    'AppVeyorMd'           = $text.MdLinkForm -f $text.AppVeyor, $text.AppVeyorProjectUrl, $text.AppVeyorMdLinkTitle
    'AppVeyorMdShield'     = $text.MdImageForm -f $text.BuildStatus, $text.AppVeyorImageUrl, $text.AppVeyorProjectUrl
    'AppVeyorRst'          = $text.RstLinkForm -f $text.AppVeyor
    'AppVeyorRstMap'       = $text.RstLinkMap -f $text.AppVeyor, $text.AppVeyorProjectUrl
    'AppVeyorRstShield'    = $text.RstImageForm -f $text.AppVeyorImageUrl, $text.AppVeyorProjectUrl, $text.BuildStatus
    'CoverallsMd'          = $text.MdLinkForm -f $text.Coveralls, $text.CoverallsProjectUrl, $text.CoverallsMdLinkTitle
    'CoverallsMdShield'    = $text.MdImageForm -f $text.CoverageStatus, $text.CoverallsImageUrl, $text.CoverallsProjectUrl
    'CoverallsRst'         = $text.RstLinkForm -f $text.Coveralls
    'CoverallsRstMap'      = $text.RstLinkMap -f $text.Coveralls, $text.CoverallsProjectUrl
    'CoverallsRstShield'   = $text.RstImageForm -f $text.CoverallsImageUrl, $text.CoverallsProjectUrl, $text.CoverageStatus
    'GitHubRst'            = $text.RstLinkForm -f $text.AvailableOnGitHub
    'GitHubRstMap'         = $text.RstLinkMap -f $text.AvailableOnGitHub, $repoUrl
    'macOSBold'            = $text.BoldForm -f $text.macOS
    'PesterMd'             = $text.MdLinkForm -f $text.Pester, $text.PesterUrl, $text.PesterMdLinkTitle
    'PesterRst'            = $text.RstLinkForm -f $text.Pester
    'PesterRstMap'         = $text.RstLinkMap -f $text.Pester, $text.PesterUrl
    'PSDownloadsMdShield'  = $text.MdImageForm -f $text.TotalDownloads, $text.PSDownloadsImageUrl, $text.PSGalleryProjectUrl
    'PSDownloadsRstShield' = $text.RstImageForm -f $text.PSDownloadsImageUrl, $text.PSGalleryProjectUrl, $text.TotalDownloads
    'PSGalleryMd'          = $text.MdLinkForm -f $text.PSGallery, $text.PSGalleryProjectUrl, $text.PSGalleryMdLinkTitle
    'PSGalleryMdShield'    = $text.MdImageForm -f $text.CurrentVersion, $text.PSGalleryImageUrl, $text.PSGalleryProjectUrl
    'PSGalleryRst'         = $text.RstLinkForm -f $text.PSGallery
    'PSGalleryRstMap'      = $text.RstLinkMap -f $text.PSGallery, $text.PSGalleryProjectUrl
    'PSGalleryRstShield'   = $text.RstImageForm -f $text.PSGalleryImageUrl, $text.PSGalleryProjectUrl, $text.CurrentVersion
    'ReadTheDocsMd'        = $text.MdBoldLinkForm -f 'full documentation', $text.ReadTheDocsProjectUrl, $text.ReadTheDocsMdLinkTitle
    'ReadTheDocsMdShield'  = $text.MdImageForm -f $text.DocumentationStatus, $text.ReadTheDocsImageUrl, $text.ReadTheDocsProjectUrl
    'ReadTheDocsRstShield' = $text.RstImageForm -f $text.ReadTheDocsImageUrl, $text.ReadTheDocsProjectUrl, $text.DocumentationStatus
    'RestfulApiMd'         = $text.MdLinkForm -f $text.RestfulApi, $text.ArmorApiGuideUrl, $text.RestfulApiMdLinkTitle
    'RestfulApiRst'        = $text.RstLinkForm -f $text.RestfulApi
    'RestfulApiRstMap'     = $text.RstLinkMap -f $text.RestfulApi, $text.ArmorApiGuideUrl
    'TravisCiMd'           = $text.MdLinkForm -f $text.TravisCi, $text.TravisCiProjectUrl, $text.TravisCiMdLinkTitle
    'TravisCiMdShield'     = $text.MdImageForm -f $text.BuildStatus, $text.TravisCiImageUrl, $text.TravisCiProjectUrl
    'TravisCiRst'          = $text.RstLinkForm -f $text.TravisCi
    'TravisCiRstMap'       = $text.RstLinkMap -f $text.TravisCi, $text.TravisCiProjectUrl
    'TravisCiRstShield'    = $text.RstImageForm -f $text.TravisCiImageUrl, $text.TravisCiProjectUrl, $text.BuildStatus
    'UbuntuBold'           = $text.BoldForm -f $text.Ubuntu
    'WindowsBold'          = $text.BoldForm -f $text.Windows
}

if ( ( Test-Path -Path $env:CI_MODULE_PATH ) -eq $false ) {
    throw "Module directory: '${env:CI_MODULE_PATH}' not found."
}

Write-Host -Object "`nSet the working directory to: '${env:CI_MODULE_PATH}'." -ForegroundColor 'Yellow'
Push-Location -Path $env:CI_MODULE_PATH -ErrorAction 'Stop'

Write-Host -Object "`nTest and import the module manifest." -ForegroundColor 'Yellow'
$manifest = Test-ModuleManifest -Path $env:CI_MODULE_MANIFEST_PATH -ErrorAction 'Stop'

Write-Host -Object "`tOld Version: '$( $manifest.Version )'."
Write-Host -Object "`tNew Version: '${env:CI_MODULE_VERSION}'."

Write-Host -Object "`nUpdate the module manifest." -ForegroundColor 'Yellow'

$year = ( Get-Date ).Year

$description = (
    'A module for retrieving the latest Windows 10 / 8.1 / 7 (and Windows Server) Cumulative or Monthly Rollup ' +
    'updates from the Microsoft Update History page, downloading the update file locally and importing into a ' +
    'Microsoft Deployment Toolkit deployment share. Importing the updates into an MDT share speeds the installation ' +
    'and patching of Windows 10. ' +
    '`r`n`r`n' +
    'Get-LatestUpdate supports querying for Windows builds and processor architecture for downloading updates to ' +
    'suit your specific environment.' +
    '`r`n`r`n' +
    'Get-LatestUpdate and Save-LatestUpdate support PowerShell Core; however, Import-LatestUpdate requires the ' +
    'Microsoft Deployment Toolkit, so requires Windows PowerShell until Microsoft updates the MDT PowerShell module ' +
    'to support PowerShell Core.'
)

$functionsToExport = ( Get-ChildItem -Path "${env:CI_MODULE_PATH}/Public" ).BaseName

$fileList = Get-ChildItem -Path "${env:CI_MODULE_PATH}" -File -Recurse |
    Resolve-Path -Relative

$scriptsToProcess = Get-ChildItem -Path "${env:CI_MODULE_PATH}/Lib" -File |
    Resolve-Path -Relative

$splat = @{
    'Path'                  = $env:CI_MODULE_MANIFEST_PATH
    'RootModule'            = "${env:CI_MODULE_NAME}.psm1"
    'ModuleVersion'         = $env:CI_MODULE_VERSION
    'Guid'                  = '1a3f9720-247a-4a25-8120-a164b35856ef'
    'Author'                = 'Aaron Parker'
    'CompanyName'           = 'stealthpuppy'
    'Copyright'             = "(c) 2018-${year} Aaron Parker. All rights reserved."
    'Description'           = $description
    'PowerShellVersion'     = '5.0'
    'ProcessorArchitecture' = 'None'
    'ScriptsToProcess'      = $scriptsToProcess
    'FunctionsToExport'     = $functionsToExport
    'FileList'              = $fileList
    'Tags'                  = 'Get-LatestUpdate', 'Import-LatestUpdate', 'Save-LatestUpdate'
    'LicenseUri'            = "$( $text.RepoUrl )/blob/master/LICENSE.txt"
    'IconUri'               = 'http://i.imgur.com/fbXjkCn.png'
    'ErrorAction'           = 'Stop'
}

Update-ModuleManifest @splat

Write-Host -Object "`nAdjust a couple of PowerShell manifest auto-generated items." -ForegroundColor 'Yellow'
$manifestContent = Get-Content -Path $env:CI_MODULE_MANIFEST_PATH
$manifestContent -replace "PSGet_${env:CI_MODULE_NAME}|NewManifest", $env:CI_MODULE_NAME |
    Set-Content -Path $env:CI_MODULE_MANIFEST_PATH -ErrorAction 'Stop'

Write-Host -Object "`nTest and import the module manifest again." -ForegroundColor 'Yellow'
$manifest = Test-ModuleManifest -Path $env:CI_MODULE_MANIFEST_PATH -ErrorAction 'Stop'

Pop-Location -ErrorAction 'Stop'
$location = Get-Location
Write-Host -Object "`nRestored the working directory to: '${location}'." -ForegroundColor 'Yellow'

Write-Host -Object "`nImport module: '${env:CI_MODULE_NAME}'." -ForegroundColor 'Yellow'
Import-Module -Name $env:CI_MODULE_MANIFEST_PATH -Force
