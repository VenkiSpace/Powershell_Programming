
Import-Module ./FilesAndFolders/01_DeleteFolder.ps1

Import-Module ./FilesAndFolders/02_CreateFolder.ps1

Import-Module ./FilesAndFolders/03_CreateFile.ps1

Import-Module ./FilesAndFolders/04_UpdateFile.ps1

DeleteFolder -src_folder ".\FilesAndFolders\data"

CreateFolder -src_folder ".\FilesAndFolders\data\src"

CreateFolder -src_folder ".\FilesAndFolders\data\dst"

CreateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

UpdateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

CopyFolder -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt" -dst_folder ".\FilesAndFolders\data\dst"


###
#   Task : Copy source folder into destination folder
###

function CopyFolder
{
    param
    (
        $src_folder,

        $src_file,

        $dst_folder
    )   
 
    "`nTask : Copy $src_folder into $dst_folder"
    
    if((Test-Path -Path $src_folder) -and (Test-Path -Path $dst_folder)) 
    {
        Copy-Item -Path $src_folder -Destination $dst_folder -Force

        "Folder $src_folder is copied into $dst_folder successfully !!!"
    }
    else 
    {
         "Folder copy is failed due to either folder $src_folder or $dst_folder doest not exist."
    }
}