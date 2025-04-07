
#------------------------------------------------------------------#
#   Create folder if it does not exist                             #
#------------------------------------------------------------------#

#  .\FilesAndFolders\02_CreateFolder.ps1 -folder ".\FilesAndFolders\data\src"

param 
(
    [string]$folder
)

Import-Module ./FilesAndFolders/00_FileService.psm1 -Function DeleteFolder, CreateFolder

if($folder -eq "")
{
    Write-Host("Folder to be created is not provided as input.")

    return 0     
}

Write-Host("`nTask : Create folder $folder if it does not exists")

DeleteFolder -folder $folder

CreateFolder -folder $folder

