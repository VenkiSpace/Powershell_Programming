
Import-Module ./FilesAndFolders/01_DeleteFolder.ps1

Import-Module ./FilesAndFolders/02_CreateFolder.ps1

Import-Module ./FilesAndFolders/03_CreateFile.ps1

DeleteFolder -src_folder ".\FilesAndFolders\data"

CreateFolder -src_folder ".\FilesAndFolders\data\src\sub1\sub11"

CreateFolder -src_folder ".\FilesAndFolders\data\src\sub1\sub12"

CreateFolder -src_folder ".\FilesAndFolders\data\src\sub1\sub21"

CreateFolder -src_folder ".\FilesAndFolders\data\src\sub1\sub22"

CreateFolder -src_folder ".\FilesAndFolders\data\dst"

CreateFile -src_folder ".\FilesAndFolders\data\src" -src_file "src.txt"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1" -src_file "sub1.txt"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub11" -src_file "sub11.txt"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub12" -src_file "sub12.txt"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub21" -src_file "sub21.txt"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub22" -src_file "sub22.txt"

MoveFolderAndSubFolders -src_folder ".\FilesAndFolders\data\src" -dst_folder ".\FilesAndFolders\data\dst"


###
#   Task : Move source folder and sub folders into destination folder
###

function MoveFolderAndSubFolders
{
    param
    (
        $src_folder,

        $dst_folder
    )   
 
    "`nTask : Move $src_folder and its sub folders into $dst_folder"

    if((Test-Path -Path $src_folder) -and (Test-Path -Path $dst_folder)) 
    {
            

        "Folder $src_folder and its sub folders are moved into $dst_folder successfully !!!"
    }
    else 
    {
         "Folder movement failed due to either folder $src_folder or $dst_folder doest not exist."
    }
}


