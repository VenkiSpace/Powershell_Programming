
Import-Module ./FilesAndFolders/01_DeleteFolder.ps1

Import-Module ./FilesAndFolders/02_CreateFolder.ps1

Import-Module ./FilesAndFolders/03_CreateFile.ps1

Import-Module ./FilesAndFolders/04_UpdateFile.ps1

DeleteFolder -src_folder ".\FilesAndFolders\data"

CreateFolder -src_folder ".\FilesAndFolders\data\src"

CreateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

UpdateFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt"

MoveFile -src_folder ".\FilesAndFolders\data\src" -src_file "sample.txt" -dst_folder ".\FilesAndFolders\data\dst"

###
#   Task : Move a file from source directory to destination directory
###

function MoveFile
{
    param
    (
        $src_folder,
        $src_file,
        $dst_folder
    )

    "`nTask : Move file $src_file from  $src_folder to $dst_folder"

    $src_file_path = $src_folder + "\" + $src_file

    # To move all files from source folder

        # $src_file_path = $src_folder + "\*"  

    # To move specify type of files from source folder
    
        # $src_file_path = $src_folder + "\*.txt"  

    if(Test-Path -Path $src_file_path -PathType Leaf)
    {
        if(Test-Path -Path $dst_folder)
        {
            "Folder $dst_folder is already exists. No Action Required"
        }
        else 
        {
          "Folder $dst_folder does not exist. Folder will be created"

            New-Item -Path $dst_folder -ItemType Directory
        }

        Move-Item -Path $src_file_path -Destination $dst_folder -Force

        "File $src_file is moved from source folder $src_folder to destination folder $dst_folder successfully!!!"
    }
    else 
    {
        "File movement is failed as $src_file doest not exist in folder $src_folder"
    }
}
