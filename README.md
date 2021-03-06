# LatestUpdate

[![License][license-badge]][license]
[![Build status][appveyor-badge]][appveyor-build]
[![GitHub Release][github-release-badge]][github-release]
[![PowerShell Gallery][psgallery-badge]][psgallery]
[![PowerShell Gallery Version][psgallery-version-badge]][psgallery]

## About

This repository hosts a module for retrieving the latest Cumulative Update, Monthly Rollups, Servicing Stack and Adobe Flash Player updates for various Windows builds from the Microsoft Update Catalog. In addition, it provides functions for downloading the update files and importing them into a Microsoft Deployment Toolkit deployment share for speeding the creation of reference images or Windows deployments.

Importing a cumulative update into [the Packages nodes in an MDT share](https://docs.microsoft.com/en-us/sccm/mdt/use-the-mdt#ConfiguringPackagesintheDeploymentWorkbench) enables updates during the offline phase of Windows setup, speeding up an installation of Windows. Updates could also be [applied directly to a WIM](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/dism-operating-system-package-servicing-command-line-options).

## Documentation

Regularly updated documentation for the module is located at [https://docs.stealthpuppy.com/latestupdate/](https://docs.stealthpuppy.com/latestupdate/)

## Supported Platforms

LatestUpdate supports PowerShell 5.0 and above and is tested on macOS, Windows 10 and Windows Server 2016. Some basic testing has been done on Windows 7 with WMF 5.1. If you are running an earlier version of PowerShell, update to the latest release of the [Windows Management Framework](https://docs.microsoft.com/en-us/powershell/wmf/readme) or please use the [previous scripts](https://github.com/aaronparker/MDT/tree/master/Updates) instead.

### PowerShell Core

`Get-LatestUpdate`, `Get-LatestFlash`, `Get-LatestServicingStack` and `Save-LatestUpdate` support PowerShell Core; however, because `Import-LatestUpdate` requires the MDT Workbench, `Import-LatestUpdate` only runs under Windows PowerShell.

[appveyor-badge]: https://ci.appveyor.com/api/projects/status/s4g24puifpegq7kf/branch/master?svg=true&logo=PowerShell&style=flat-square
[appveyor-build]: https://ci.appveyor.com/project/aaronparker/latestupdate/
[psgallery-badge]: https://img.shields.io/powershellgallery/dt/latestupdate.svg?logo=PowerShell&style=flat-square
[psgallery]: https://www.powershellgallery.com/packages/latestupdate
[psgallery-version-badge]: https://img.shields.io/powershellgallery/v/LatestUpdate.svg?logo=PowerShell&style=flat-square
[psgallery-version]: https://www.powershellgallery.com/packages/latestupdate
[github-release-badge]: https://img.shields.io/github/release/aaronparker/LatestUpdate.svg?logo=github&style=flat-square
[github-release]: https://github.com/aaronparker/LatestUpdate/releases/latest
[license-badge]: https://img.shields.io/github/license/aaronparker/latestupdate.svg?style=flat-square
[license]: https://github.com/aaronparker/latestupdate/blob/master/LICENSE
