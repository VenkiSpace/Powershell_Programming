
#------------------------------------------------------------------#
#  Create file if it does not exist                                #
#------------------------------------------------------------------#

#  .\FilesAndFolders\03_CreateFile.ps1 -folder ".\FilesAndFolders\data\src" -file "sample.txt"

param 
(
    [string]$folder,

    [string]$file
)

Import-Module ./FilesAndFolders/00_FileService.psm1 -Function DeleteFolder, CreateFolder, CreateFile

DeleteFolder -folder $folder

CreateFolder -folder $folder

CreateFile -folder $folder -file $file

