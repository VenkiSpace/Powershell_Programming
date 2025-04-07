
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

CreateFile -src_folder ".\FilesAndFolders\data\src" -src_file "src.jpg"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1" -src_file "sub1.jpg"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub11" -src_file "sub11.jpg"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub12" -src_file "sub12.jpg"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub21" -src_file "sub21.jpg"

CreateFile -src_folder ".\FilesAndFolders\data\src\sub1\sub22" -src_file "sub22.jpg"

MoveFolderAndSubFoldersFilePattern -src_folder ".\FilesAndFolders\data\src" -pattern ".jpg" -dst_folder ".\FilesAndFolders\data\dst"


###
#   Task : Move source folder, sub folders, and files wiht specific file pattern into destination folder
###

function MoveFolderAndSubFoldersFilePattern
{
    param
    (
        $src_folder,

        $pattern,

        $dst_folder
    )   
 
    "`nTask : Move $src_folder and its sub folders, files with specific pattern into $dst_folder"

    if((Test-Path -Path $src_folder) -and (Test-Path -Path $dst_folder)) 
    {
        $src_folder_path = $src_folder + "\*" + $pattern

        Get-ChildItem $src_folder_path -Recurse | Move-Item -Destination $dst_folder
        
       # Get-ChildItem 'dot-slash *.($src_folder_path)' -Recurse | Move-Item -Destination 'dot-slash'

        "Folder $src_folder, sub folders and files with specific file pattern are moved into $dst_folder successfully !!!"
    }
    else 
    {
         "Folder movement failed due to either folder $src_folder or $dst_folder doest not exist."
    }
}


