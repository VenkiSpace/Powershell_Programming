
#------------------------------------------------------------------#
# Delete Folder, Sub Folders and Files if exists                   #
#------------------------------------------------------------------#

#  .\FilesAndFolders\01_DeleteFolder.ps1 -folder ".\FilesAndFolders\data\src"

param 
( 
    [string]$folder
)

Import-Module ./FilesAndFolders/00_FileService.psm1 -Function DeleteFolder

if($folder -eq "")
{
    Write-Host("Folder to be deleted is not provided as input.")

    return 0      
}

DeleteFolder -folder $folder
