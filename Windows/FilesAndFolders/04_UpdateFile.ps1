
#------------------------------------------------------------------#
#  Update content to the specified file                            #
#------------------------------------------------------------------#

#  .\FilesAndFolders\03_CreateFile.ps1 -folder ".\FilesAndFolders\data\src" -file "sample.txt" -content "Sample Text"

param
(
    $folder,

    $file,

    $content
)

Import-Module ./FilesAndFolders/00_FileService.psm1 -Function DeleteFolder, CreateFolder, CreateFile, UpdateFile

DeleteFolder -folder $folder

CreateFolder -folder $folder

CreateFile -folder $folder -file $file

UpdateFile -folder $folder -file $file -content $content
