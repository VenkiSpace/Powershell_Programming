
Import-Module ./FilesAndFolders/01_DeleteFolder.ps1

Import-Module ./FilesAndFolders/02_CreateFolder.ps1

Import-Module ./FilesAndFolders/03_CreateFile.ps1

Import-Module ./FilesAndFolders/04_UpdateFile.ps1

DeleteFolder -src_folder ".\FilesAndFolders\data"

CreateFolder -src_folder ".\FilesAndFolders\data\src"

CreateFolder -src_folder ".\FilesAndFolders\data\dst"

CreateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

UpdateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

MoveFolder -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt" -dst_folder ".\FilesAndFolders\data\dst"


###
#   Task : Move source folder into destination folder
###

function MoveFolder
{
    param
    (
        $src_folder,

        $src_file,

        $dst_folder
    )   
 
    "`nTask : Move $src_folder into $dst_folder"

    $a = $src_folder.LastIndexOf('\')

    $b = $a + 1

    $c = $src_folder.Length - 1

    $d = $c - $a

    $e = $src_folder.Substring($b, $d)

    $copy_folder_path = $dst_folder + "\" + $e

    "copy_folder_path $copy_folder_path"
    
    if((Test-Path -Path $src_folder) -and (Test-Path -Path $dst_folder)) 
    {
        Move-Item -Path $src_folder -Destination $dst_folder -Force

        "Folder $src_folder is moved into $dst_folder successfully !!!"
    }
    else 
    {
         "Folder movement failed due to either folder $src_folder or $dst_folder doest not exist."
    }
}