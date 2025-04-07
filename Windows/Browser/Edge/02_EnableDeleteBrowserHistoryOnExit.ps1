Set-Location HKLM:\Software\Policies\Microsoft\Edge

New-Item -Path .\ -Name Recommended

New-ItemProperty -Path .\Recommeded -Name ClearBrowsingDataOnExit -Value 1 -PropertyType DWord

New-ItemProperty -Path .\Recommeded -Name ClearCachedImagesAndFilesOnExit -Value 1 -PropertyType DWord