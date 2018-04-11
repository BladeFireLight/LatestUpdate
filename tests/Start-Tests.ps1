<#
    Tests script
#>
# Run tests and upload results
$res = Invoke-Pester -Path (Join-Path (Resolve-Path $PWD) "tests") -OutputFormat NUnitXml -OutputFile TestsResults.xml -PassThru
(New-Object 'System.Net.WebClient').UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", `
    (Resolve-Path (Join-Path $PWD "TestsResults.xml")))

# If failed, Throw
If ($res.FailedCount -gt 0) { Throw "$($res.FailedCount) tests failed." }

# Commit changes
git config --global credential.helper store
Add-Content (Join-Path $env:USERPROFILE ".git-credentials") "https://$($env:GitHubKey):x-oauth-basic@github.com`n"
git config --global user.email "aaron@stealthpuppy.com"
git config --global user.name "Aaron Parker"
git config --global core.autocrlf true
git config --global core.safecrlf false
